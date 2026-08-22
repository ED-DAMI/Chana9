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
      if (permission == LocationPermission.deniedForever) {
        throw Exception('permission_denied');
      }

      final position = await Geolocator.getCurrentPosition();
      final placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _latitude = position.latitude;
          _longitude = position.longitude;
          _addressController.text =
              [place.street, place.subLocality]
                  .where((e) => e != null && e.isNotEmpty)
                  .join(', ');
        });
        final detectedCity =
            place.locality ?? place.subAdministrativeArea ?? '';
        final detectedAdmin = place.administrativeArea ?? '';

        String? matchedRegion;
        String? matchedCity;
        for (final entry in kMoroccoRegionsAndCities.entries) {
          for (final city in entry.value) {
            if (detectedCity.toLowerCase().contains(city.toLowerCase()) ||
                city.toLowerCase().contains(detectedCity.toLowerCase())) {
              matchedRegion = entry.key;
              matchedCity = city;
              break;
            }
          }
          if (matchedRegion != null) break;
        }
        if (matchedRegion == null) {
          for (final region in kMoroccoRegionsAndCities.keys) {
            final regionParts = region.split('-');
            for (final part in regionParts) {
              if (detectedAdmin
                  .toLowerCase()
                  .contains(part.trim().toLowerCase())) {
                matchedRegion = region;
                break;
              }
            }
            if (matchedRegion != null) break;
          }
        }

        if (matchedRegion != null) {
          setState(() {
            _selectedRegion = matchedRegion;
            _selectedCity = matchedCity;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(l10n.locationError),
              backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLocating = false);
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
    final theme = Theme.of(context);

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
              stepIconBuilder: (int stepIndex, StepState stepState) {
                final color = _currentStep >= stepIndex
                    ? theme.colorScheme.primary
                    : Colors.grey;

                final IconData? iconData = switch (stepIndex) {
                  0 => Icons.photo_camera_rounded,
                  1 => Icons.pets_rounded,
                  2 => Icons.sell_rounded,
                  3 => Icons.location_on_rounded,
                  _ => null,
                };

                return iconData != null
                    ? Icon(iconData, color: color, size: 18)
                    : null;
              },
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
                    l10n: l10n,
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
                    onNegotiableChanged: (v) => setState(() => _priceNegotiable = v),
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
                    onDeliveryChanged: (v) => setState(() => _deliveryAvailable = v),
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
  final AppLocalizations l10n;
  final List<XFile> photos;
  final VoidCallback onAdd;
  final Function(int) onRemove;

  const _PhotoStep({
    required this.l10n,
    required this.photos,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
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
                        child: const Icon(Icons.close,
                            color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (photos.length < 5)
              GestureDetector(
                onTap: onAdd,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: theme.colorScheme.primary.withOpacity(0.5),
                        width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                    color: theme.colorScheme.primary.withOpacity(0.05),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo_rounded,
                        color: theme.colorScheme.primary,
                        size: 28,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${photos.length}/5',
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        if (photos.isEmpty) ...[
          const SizedBox(height: 8),
          Text(
            l10n.addAtLeastOnePhoto,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
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
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        DropdownButtonFormField<AnimalBreed>(
          value: selectedBreed,
          decoration: InputDecoration(
            labelText: '${l10n.breed} *',
            border: const OutlineInputBorder(),
            prefixIcon: Icon(Icons.category_outlined, color: primary),
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
            ButtonSegment(
              value: null,
              label: Text(l10n.not_specified),
            ),
            ButtonSegment(
              value: AnimalGender.male,
              label: Text(l10n.male),
              icon: const Icon(Icons.male),
            ),
            ButtonSegment(
              value: AnimalGender.female,
              label: Text(l10n.female),
              icon: const Icon(Icons.female),
            ),
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
                  prefixIcon:
                  Icon(Icons.calendar_today_outlined, color: primary),
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
                  prefixIcon: Icon(Icons.scale_outlined, color: primary),
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
            prefixIcon:
            Icon(Icons.format_list_bulleted_rounded, color: primary),
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
            prefixIcon: Icon(Icons.groups_outlined, color: primary),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: onssaController,
          decoration: InputDecoration(
            labelText: l10n.onssaTag,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(Icons.verified_outlined, color: primary),
          ),
        ),
        const SizedBox(height: 4),
        SwitchListTile(
          title: Row(
            children: [
              Icon(Icons.volunteer_activism_outlined,
                  color: primary, size: 20),
              const SizedBox(width: 8),
              Text(l10n.eligibleForAid),
            ],
          ),
          value: eligibleForAid,
          onChanged: onEligibleChanged,
          contentPadding: EdgeInsets.zero,
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
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(
            labelText: '${l10n.title} *',
            border: const OutlineInputBorder(),
            prefixIcon: Icon(Icons.title_rounded, color: primary),
          ),
          validator: (v) => v!.isEmpty ? l10n.required : null,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: priceController,
          decoration: InputDecoration(
            labelText: '${l10n.price} *',
            border: const OutlineInputBorder(),
            prefixIcon: Icon(Icons.payments_outlined, color: primary),
            suffixText: l10n.mad,
          ),
          keyboardType: TextInputType.number,
        ),
        SwitchListTile(
          title: Row(
            children: [
              Icon(Icons.handshake_outlined, color: primary, size: 20),
              const SizedBox(width: 8),
              Text(l10n.priceNegotiable),
            ],
          ),
          value: priceNegotiable,
          onChanged: onNegotiableChanged,
          contentPadding: EdgeInsets.zero,
        ),
        TextFormField(
          controller: descriptionController,
          decoration: InputDecoration(
            labelText: l10n.description,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(Icons.description_outlined, color: primary),
            alignLabelWithHint: true,
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
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: isLocating ? null : onDetectLocation,
            icon: isLocating
                ? const SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
                : Icon(
              hasLocation ? Icons.my_location : Icons.gps_fixed,
              color: hasLocation ? Colors.green : null,
            ),
            label: Text(hasLocation ? l10n.position_ok : l10n.geolocate_me),
            style: ElevatedButton.styleFrom(
              foregroundColor: hasLocation ? Colors.green : primary,
              side: BorderSide(
                  color: hasLocation
                      ? Colors.green
                      : primary.withOpacity(0.5)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: selectedRegion,
          decoration: InputDecoration(
            labelText: '${l10n.region} *',
            border: const OutlineInputBorder(),
            prefixIcon: Icon(Icons.map_outlined, color: primary),
          ),
          items: kMoroccoRegionsAndCities.keys
              .map((r) => DropdownMenuItem(value: r, child: Text(r)))
              .toList(),
          onChanged: onRegionChanged,
        ),
        const SizedBox(height: 12),
        if (selectedRegion != null) ...[
          DropdownButtonFormField<String>(
            value: selectedCity,
            decoration: InputDecoration(
              labelText: l10n.city,
              border: const OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_city_outlined, color: primary),
            ),
            items: kMoroccoRegionsAndCities[selectedRegion]!
                .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                .toList(),
            onChanged: onCityChanged,
          ),
          const SizedBox(height: 12),
        ],
        TextField(
          controller: addressController,
          decoration: InputDecoration(
            labelText: l10n.preciseAddress,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(Icons.pin_drop_outlined, color: primary),
          ),
        ),
        SwitchListTile(
          title: Row(
            children: [
              Icon(Icons.local_shipping_outlined, color: primary, size: 20),
              const SizedBox(width: 8),
              Text(l10n.deliveryPossible),
            ],
          ),
          value: deliveryAvailable,
          onChanged: onDeliveryChanged,
          contentPadding: EdgeInsets.zero,
        ),
        if (deliveryAvailable) ...[
          const SizedBox(height: 8),
          TextField(
            controller: deliveryPriceController,
            decoration: InputDecoration(
              labelText: l10n.deliveryFees,
              border: const OutlineInputBorder(),
              prefixIcon:
              Icon(Icons.local_shipping_outlined, color: primary),
              suffixText: l10n.mad,
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ],
    );
  }
}