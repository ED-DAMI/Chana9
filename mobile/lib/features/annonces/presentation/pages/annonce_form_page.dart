import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';
import 'package:ma_chana9_app/shared/enums/animal_breed.dart';
import '../../../../core/constants/morocco_regions.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/enums/animal_dentition.dart';
import '../../domain/entities/annonce.dart';
import '../bloc/annonce_bloc.dart';


class AnnonceFormPage extends StatefulWidget {
  final Annonce? annonce;
  const AnnonceFormPage({super.key, this.annonce});

  @override
  State<AnnonceFormPage> createState() => _AnnonceFormPageState();
}

class _AnnonceFormPageState extends State<AnnonceFormPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  final List<XFile> _photos = [];
  final ImagePicker _picker = ImagePicker();

  AnimalBreed? _selectedBreed;
  AnimalGender? _gender;
  AnimalDentition? _dentition;
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  final _onssaController = TextEditingController();
  final _headCountController = TextEditingController();
  bool _eligibleForAid = false;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  bool _priceNegotiable = false;

  String? _selectedRegion;
  String? _selectedCity;
  final _addressController = TextEditingController();
  bool _deliveryAvailable = false;
  final _deliveryPriceController = TextEditingController();

  bool _isLocating = false;
  double? _latitude;
  double? _longitude;

  bool get _isEditing => widget.annonce != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) _prefill(widget.annonce!);
  }

  void _prefill(Annonce a) {
    _selectedBreed = a.breed;
    _gender = a.gender;
    _dentition = a.dentition;
    _ageController.text = a.ageMonths?.toString() ?? '';
    _weightController.text = a.weightKg?.toString() ?? '';
    _onssaController.text = a.onssaTagNumber ?? '';
    _headCountController.text = a.headCount?.toString() ?? '';
    _titleController.text = a.title;
    _descriptionController.text = a.description ?? '';
    _priceController.text = a.price.toString();
    _priceNegotiable = a.priceNegotiable;
    _addressController.text = a.addressLabel ?? '';
    _deliveryAvailable = a.deliveryAvailable;
    _deliveryPriceController.text = a.deliveryPrice?.toString() ?? '';
    _latitude = a.latitude;
    _longitude = a.longitude;
    _selectedRegion = a.region;
  }

  @override
  void dispose() {
    _weightController.dispose();
    _ageController.dispose();
    _onssaController.dispose();
    _headCountController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _addressController.dispose();
    _deliveryPriceController.dispose();
    super.dispose();
  }

  Future<void> _detectLocation() async {
    setState(() => _isLocating = true);
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      final position = await Geolocator.getCurrentPosition();
      final placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _latitude = position.latitude;
          _longitude = position.longitude;
          _addressController.text =
              "${place.street ?? ''}, ${place.subLocality ?? ''}".trim();

          for (var region in kMoroccoRegionsAndCities.keys) {
            if (place.administrativeArea?.contains(region) ?? false) {
              _selectedRegion = region;
              break;
            }
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => _isLocating = false);
    }
  }

  Map<String, dynamic> _buildBody() {
    return {
      'title': _titleController.text.trim(),
      'breed': _selectedBreed?.name,
      'price': double.tryParse(_priceController.text) ?? 0.0,
      'priceNegotiable': _priceNegotiable,
      'region': _selectedRegion ?? '',
      'eligibleForAid': _eligibleForAid,
      'deliveryAvailable': _deliveryAvailable,
      'description': _descriptionController.text.trim(),
      'gender': _gender?.name,
      'ageMonths': int.tryParse(_ageController.text),
      'addressLabel': _selectedCity != null
          ? '$_selectedCity, ${_addressController.text}'
          : _addressController.text,
      'latitude': _latitude,
      'longitude': _longitude,
      if (_weightController.text.isNotEmpty)
        'weightKg': double.tryParse(_weightController.text),
      if (_onssaController.text.isNotEmpty)
        'onssaTagNumber': _onssaController.text.trim(),
      if (_headCountController.text.isNotEmpty)
        'headCount': int.tryParse(_headCountController.text),
      if (_dentition != null) 'dentition': _dentition!.name,
      if (_deliveryAvailable)
        'deliveryPrice': double.tryParse(_deliveryPriceController.text),
    };
  }

  void _submit() {
    if (_photos.isEmpty && !_isEditing) return;
    if (!_formKey.currentState!.validate()) return;

    if (_isEditing) {
      context.read<AnnonceBloc>().add(AnnonceEvent.updateAnnonce(
        id: widget.annonce!.id,
        body: _buildBody(),
      ));
    } else {
      context.read<AnnonceBloc>().add(AnnonceEvent.createAnnonceWithMedias(
        body: _buildBody(),
        photoPaths: _photos.map((x) => x.path).toList(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<AnnonceBloc, AnnonceState>(
      listener: (context, state) {
        state.whenOrNull(
          annonceCreated: (_) => Navigator.pop(context),
          annonceUpdated: (_) => Navigator.pop(context),
          failure: (msg) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg), backgroundColor: Colors.red),
          ),
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          uploadingMedias: (_, __) => true,
          orElse: () => false,
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(_isEditing ? l10n.edit_annonce : l10n.newAnnonce),
          ),
          body: Form(
            key: _formKey,
            child: Stepper(
              currentStep: _currentStep,
              type: StepperType.vertical,
              onStepTapped: (step) => setState(() => _currentStep = step),
              onStepContinue: () {
                if (_currentStep < 3) {
                  setState(() => _currentStep++);
                } else {
                  _submit();
                }
              },
              onStepCancel: () {
                if (_currentStep > 0) {
                  setState(() => _currentStep--);
                } else {
                  Navigator.pop(context);
                }
              },
              controlsBuilder: (context, details) => Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    FilledButton(
                      onPressed: isLoading ? null : details.onStepContinue,
                      child: isLoading && _currentStep == 3
                          ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                          : Text(_currentStep == 3 ? l10n.publish : l10n.next),
                    ),
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: Text(l10n.back),
                    ),
                  ],
                ),
              ),
              steps: [
                Step(
                  title: Text(l10n.step_photos),
                  content: _PhotoStep(
                    photos: _photos,
                    onAdd: () => _showPhotoOptions(l10n),
                    onRemove: (i) => setState(() => _photos.removeAt(i)),
                  ),
                ),
                Step(
                  title: Text(l10n.step_animal),
                  content: _AnimalStep(
                    l10n: l10n,
                    selectedBreed: _selectedBreed,
                    ageController: _ageController,
                    weightController: _weightController,
                    gender: _gender,
                    dentition: _dentition,
                    onssaController: _onssaController,
                    headCountController: _headCountController,
                    eligibleForAid: _eligibleForAid,
                    onBreedChanged: (b) => setState(() => _selectedBreed = b),
                    onGenderChanged: (g) => setState(() => _gender = g),
                    onDentitionChanged: (d) => setState(() => _dentition = d),
                    onEligibleChanged: (v) => setState(() => _eligibleForAid = v),
                  ),
                ),
                Step(
                  title: Text(l10n.step_details),
                  content: _AnnonceStep(
                    l10n: l10n,
                    titleController: _titleController,
                    descriptionController: _descriptionController,
                    priceController: _priceController,
                    priceNegotiable: _priceNegotiable,
                    onNegotiableChanged: (v) =>
                        setState(() => _priceNegotiable = v),
                  ),
                ),
                Step(
                  title: Text(l10n.step_location),
                  content: _LocationStep(
                    l10n: l10n,
                    selectedRegion: _selectedRegion,
                    selectedCity: _selectedCity,
                    addressController: _addressController,
                    deliveryAvailable: _deliveryAvailable,
                    deliveryPriceController: _deliveryPriceController,
                    onRegionChanged: (r) => setState(() {
                      _selectedRegion = r;
                      _selectedCity = null;
                    }),
                    onCityChanged: (c) => setState(() => _selectedCity = c),
                    onDeliveryChanged: (v) =>
                        setState(() => _deliveryAvailable = v),
                    onDetectLocation: _detectLocation,
                    isLocating: _isLocating,
                    hasLocation: _latitude != null,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPhotoOptions(AppLocalizations l10n) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              minLeadingWidth: 24,
              title: Text(l10n.camera),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              minLeadingWidth: 24,
              title: Text(l10n.gallery),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
    if (source != null) {
      if (source == ImageSource.gallery) {
        final images = await _picker.pickMultiImage();
        setState(() => _photos.addAll(images.take(5 - _photos.length)));
      } else {
        final img = await _picker.pickImage(source: source);
        if (img != null) setState(() => _photos.add(img));
      }
    }
  }
}

class _PhotoStep extends StatelessWidget {
  final List<XFile> photos;
  final VoidCallback onAdd;
  final Function(int) onRemove;

  const _PhotoStep({
    required this.photos,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...List.generate(
          photos.length,
              (i) => Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(photos[i].path),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: GestureDetector(
                  onTap: () => onRemove(i),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, color: Colors.white, size: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (photos.length < 5)
          IconButton.filledTonal(
            onPressed: onAdd,
            icon: const Icon(Icons.add_a_photo_outlined),
            constraints: const BoxConstraints.tightFor(width: 80, height: 80),
          ),
      ],
    );
  }
}

class _AnimalStep extends StatelessWidget {
  final AppLocalizations l10n;
  final AnimalBreed? selectedBreed;
  final TextEditingController ageController;
  final TextEditingController weightController;
  final AnimalGender? gender;
  final AnimalDentition? dentition;
  final TextEditingController onssaController;
  final TextEditingController headCountController;
  final bool eligibleForAid;
  final ValueChanged<AnimalBreed?> onBreedChanged;
  final ValueChanged<AnimalGender?> onGenderChanged;
  final ValueChanged<AnimalDentition?> onDentitionChanged;
  final ValueChanged<bool> onEligibleChanged;

  const _AnimalStep({
    required this.l10n,
    required this.selectedBreed,
    required this.ageController,
    required this.weightController,
    required this.gender,
    required this.dentition,
    required this.onssaController,
    required this.headCountController,
    required this.eligibleForAid,
    required this.onBreedChanged,
    required this.onGenderChanged,
    required this.onDentitionChanged,
    required this.onEligibleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<AnimalBreed>(
          value: selectedBreed,
          decoration: InputDecoration(
            labelText: '${l10n.breed} *',
            border: const OutlineInputBorder(),
          ),
          items: AnimalBreed.values
              .map((b) => DropdownMenuItem(
            value: b,
            child: Text(b.localizedLabel(context)),
          ))
              .toList(),
          onChanged: onBreedChanged,
          validator: (v) => v == null ? l10n.breedRequired : null,
        ),
        const SizedBox(height: 12),
        SegmentedButton<AnimalGender?>(
          segments: [
            ButtonSegment(value: null, label: Text(l10n.not_specified)),
            ButtonSegment(value: AnimalGender.male, label: Text(l10n.male)),
            ButtonSegment(value: AnimalGender.female, label: Text(l10n.female)),
          ],
          selected: {gender},
          onSelectionChanged: (val) => onGenderChanged(val.first),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: l10n.age_months,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: l10n.weight_kg,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<AnimalDentition>(
          value: dentition,
          decoration: InputDecoration(
            labelText: l10n.dentition,
            border: const OutlineInputBorder(),
          ),
          items: AnimalDentition.values
              .map((d) => DropdownMenuItem(
            value: d,
            child: Text(d.localizedDisplayName(context)),
          ))
              .toList(),
          onChanged: onDentitionChanged,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: headCountController,
          decoration: InputDecoration(
            labelText: l10n.headCount,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: onssaController,
          decoration: InputDecoration(
            labelText: l10n.onssa,
            border: const OutlineInputBorder(),
          ),
        ),
        SwitchListTile(
          title: Text(l10n.eligibleForAid),
          value: eligibleForAid,
          onChanged: onEligibleChanged,
        ),
      ],
    );
  }
}

class _AnnonceStep extends StatelessWidget {
  final AppLocalizations l10n;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final bool priceNegotiable;
  final ValueChanged<bool> onNegotiableChanged;

  const _AnnonceStep({
    required this.l10n,
    required this.titleController,
    required this.descriptionController,
    required this.priceController,
    required this.priceNegotiable,
    required this.onNegotiableChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(
            labelText: '${l10n.title} *',
            border: const OutlineInputBorder(),
          ),
          validator: (v) => v!.isEmpty ? l10n.required : null,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: priceController,
          decoration: InputDecoration(
            labelText: '${l10n.price} *',
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        SwitchListTile(
          title: Text(l10n.priceNegotiable),
          value: priceNegotiable,
          onChanged: onNegotiableChanged,
        ),
        TextFormField(
          controller: descriptionController,
          decoration: InputDecoration(
            labelText: l10n.description,
            border: const OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}

class _LocationStep extends StatelessWidget {
  final AppLocalizations l10n;
  final String? selectedRegion;
  final String? selectedCity;
  final TextEditingController addressController;
  final bool deliveryAvailable;
  final TextEditingController deliveryPriceController;
  final ValueChanged<String?> onRegionChanged;
  final ValueChanged<String?> onCityChanged;
  final ValueChanged<bool> onDeliveryChanged;
  final VoidCallback onDetectLocation;
  final bool isLocating;
  final bool hasLocation;

  const _LocationStep({
    required this.l10n,
    required this.selectedRegion,
    required this.selectedCity,
    required this.addressController,
    required this.deliveryAvailable,
    required this.deliveryPriceController,
    required this.onRegionChanged,
    required this.onCityChanged,
    required this.onDeliveryChanged,
    required this.onDetectLocation,
    required this.isLocating,
    required this.hasLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: isLocating ? null : onDetectLocation,
          icon: isLocating
              ? const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
              : const Icon(Icons.gps_fixed),
          label: Text(hasLocation ? l10n.position_ok : l10n.geolocate_me),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: selectedRegion,
          decoration: InputDecoration(
            labelText: '${l10n.region} *',
            border: const OutlineInputBorder(),
          ),
          items: kMoroccoRegionsAndCities.keys
              .map((r) => DropdownMenuItem(value: r, child: Text(r)))
              .toList(),
          onChanged: onRegionChanged,
        ),
        const SizedBox(height: 12),
        if (selectedRegion != null)
          DropdownButtonFormField<String>(
            value: selectedCity,
            decoration: const InputDecoration(
              labelText: 'Ville',
              border: OutlineInputBorder(),
            ),
            items: kMoroccoRegionsAndCities[selectedRegion]!
                .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                .toList(),
            onChanged: onCityChanged,
          ),
        const SizedBox(height: 12),
        TextField(
          controller: addressController,
          decoration: InputDecoration(
            labelText: l10n.preciseAddress,
            border: const OutlineInputBorder(),
          ),
        ),
        SwitchListTile(
          title: Text(l10n.deliveryPossible),
          value: deliveryAvailable,
          onChanged: onDeliveryChanged,
        ),
        if (deliveryAvailable)
          TextField(
            controller: deliveryPriceController,
            decoration: InputDecoration(
              labelText: l10n.deliveryFees,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
      ],
    );
  }
}