import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';
import '../../domain/entities/annonce.dart';
import '../bloc/annonce_bloc.dart';

// ── Données régions/villes ────────────────────────────────────────────────────

const Map<String, List<String>> kMoroccoRegionsAndCities = {
  'Tanger-Tétouan-Al Hoceïma': [
    'Tanger', 'Tétouan', 'Al Hoceïma', 'Larache',
    'Chefchaouen', 'Ouezzane', 'Mdiq', 'Fnideq',
  ],
  'Oriental': [
    'Oujda', 'Nador', 'Berkane', 'Taourirt',
    'Jerada', 'Guercif', 'Driouch', 'Figuig',
  ],
  'Fès-Meknès': [
    'Fès', 'Meknès', 'Taza', 'Ifrane',
    'Khénifra', 'Sefrou', 'Moulay Yacoub', 'El Hajeb', 'Boulemane',
  ],
  'Rabat-Salé-Kénitra': [
    'Rabat', 'Salé', 'Kénitra', 'Témara',
    'Skhirate', 'Khémisset', 'Sidi Kacem', 'Sidi Slimane',
  ],
  'Béni Mellal-Khénifra': [
    'Béni Mellal', 'Khénifra', 'Khouribga',
    'Fquih Ben Salah', 'Azilal',
  ],
  'Casablanca-Settat': [
    'Casablanca', 'Settat', 'Mohammedia', 'El Jadida',
    'Berrechid', 'Benslimane', 'Médiouna', 'Nouaceur',
  ],
  'Marrakech-Safi': [
    'Marrakech', 'Safi', 'Essaouira', 'El Kelaa des Sraghna',
    'Chichaoua', 'Al Haouz', 'Youssoufia', 'Rehamna',
  ],
  'Drâa-Tafilalet': [
    'Errachidia', 'Ouarzazate', 'Zagora', 'Tinghir', 'Midelt',
  ],
  'Souss-Massa': [
    'Agadir', 'Taroudannt', 'Tiznit',
    'Chtouka Aït Baha', 'Inezgane-Aït Melloul', 'Tata',
  ],
  'Guelmim-Oued Noun': [
    'Guelmim', 'Sidi Ifni', 'Assa-Zag', 'Tan-Tan',
  ],
  'Laâyoune-Sakia El Hamra': [
    'Laâyoune', 'Boujdour', 'Tarfaya', 'Es-Semara',
  ],
  'Dakhla-Oued Ed-Dahab': [
    'Dakhla', 'Aousserd',
  ],
};

// ── Page principale ───────────────────────────────────────────────────────────

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

  final _breedController = TextEditingController();
  AnimalGender? _gender;
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  bool _eligibleForAid = false;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  bool _priceNegotiable = false;

  String? _selectedRegion;
  String? _selectedCity;
  final _addressController = TextEditingController();
  bool _deliveryAvailable = false;
  final _deliveryRadiusController = TextEditingController();
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
    _breedController.text = a.breed;
    _gender = a.gender;
    _weightController.text = a.estimatedWeight?.toString() ?? '';
    _ageController.text = a.ageMonths?.toString() ?? '';
    _eligibleForAid = a.eligibleForAid;
    _titleController.text = a.title;
    _descriptionController.text = a.description ?? '';
    _priceController.text = a.price.toString();
    _priceNegotiable = a.priceNegotiable;
    _addressController.text = a.addressLabel ?? '';
    _deliveryAvailable = a.deliveryAvailable;
    _deliveryRadiusController.text = a.deliveryRadiusKm?.toString() ?? '';
    _deliveryPriceController.text = a.deliveryPrice?.toString() ?? '';
    _latitude = a.latitude;
    _longitude = a.longitude;

    // Préfill région et ville
    final region = kMoroccoRegionsAndCities.keys.firstWhere(
          (r) => r.toLowerCase() == a.region.toLowerCase(),
      orElse: () => '',
    );
    if (region.isNotEmpty) {
      _selectedRegion = region;
      final cities = kMoroccoRegionsAndCities[region] ?? [];
      final city = cities.firstWhere(
            (c) => c.toLowerCase() == (a.addressLabel ?? '').toLowerCase(),
        orElse: () => '',
      );
      if (city.isNotEmpty) _selectedCity = city;
    }
  }

  @override
  void dispose() {
    _breedController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _addressController.dispose();
    _deliveryRadiusController.dispose();
    _deliveryPriceController.dispose();
    super.dispose();
  }

  Future<void> _detectLocation() async {
    setState(() => _isLocating = true);

    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showLocationError('Le GPS est désactivé. Veuillez l\'activer.');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showLocationError('Permission de localisation refusée.');
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        _showLocationError(
            'Permission refusée définitivement. Activez-la dans les paramètres.');
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final detectedRegion = place.administrativeArea ?? '';
        final detectedCity = place.locality ?? '';
        final address = [
          place.street,
          place.subLocality,
          place.locality,
        ].where((e) => e != null && e.isNotEmpty).join(', ');

        setState(() {
          _latitude = position.latitude;
          _longitude = position.longitude;

          // Chercher la région correspondante
          final matchedRegion = kMoroccoRegionsAndCities.keys.firstWhere(
                (r) => r.toLowerCase().contains(detectedRegion.toLowerCase()) ||
                detectedRegion.toLowerCase().contains(r.toLowerCase()),
            orElse: () => '',
          );
          if (matchedRegion.isNotEmpty) {
            _selectedRegion = matchedRegion;

            // Chercher la ville correspondante
            final cities = kMoroccoRegionsAndCities[matchedRegion] ?? [];
            final matchedCity = cities.firstWhere(
                  (c) => c.toLowerCase().contains(detectedCity.toLowerCase()) ||
                  detectedCity.toLowerCase().contains(c.toLowerCase()),
              orElse: () => '',
            );
            if (matchedCity.isNotEmpty) _selectedCity = matchedCity;
          }

          if (address.isNotEmpty) _addressController.text = address;
        });
      }
    } catch (e) {
      _showLocationError('Impossible de détecter la position.');
    } finally {
      setState(() => _isLocating = false);
    }
  }

  void _showLocationError(String message) {
    setState(() => _isLocating = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  Future<void> _pickFromGallery() async {
    final images = await _picker.pickMultiImage(imageQuality: 80);
    if (images.isNotEmpty) {
      setState(() => _photos.addAll(images.take(5 - _photos.length)));
    }
  }

  Future<void> _pickFromCamera() async {
    final image = await _picker.pickImage(
        source: ImageSource.camera, imageQuality: 80);
    if (image != null && _photos.length < 5) {
      setState(() => _photos.add(image));
    }
  }

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40, height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choisir depuis la galerie'),
              subtitle: Text('${_photos.length}/5 photos'),
              onTap: () { Navigator.pop(context); _pickFromGallery(); },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Prendre une photo'),
              onTap: () { Navigator.pop(context); _pickFromCamera(); },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _buildBody() => {
    'title': _titleController.text.trim(),
    'breed': _breedController.text.trim(),
    'price': double.tryParse(_priceController.text),
    'priceNegotiable': _priceNegotiable,
    'region': _selectedRegion ?? '',
    'eligibleForAid': _eligibleForAid,
    'deliveryAvailable': _deliveryAvailable,
    if (_descriptionController.text.trim().isNotEmpty)
      'description': _descriptionController.text.trim(),
    if (_gender != null) 'gender': _gender!.value,
    if (_weightController.text.isNotEmpty)
      'estimatedWeight': double.tryParse(_weightController.text),
    if (_ageController.text.isNotEmpty)
      'ageMonths': int.tryParse(_ageController.text),
    if (_selectedCity != null) 'city': _selectedCity,
    if (_addressController.text.trim().isNotEmpty)
      'addressLabel': _addressController.text.trim(),
    if (_latitude != null) 'latitude': _latitude,
    if (_longitude != null) 'longitude': _longitude,
    if (_deliveryAvailable) ...{
      if (_deliveryRadiusController.text.isNotEmpty)
        'deliveryRadiusKm': int.tryParse(_deliveryRadiusController.text),
      if (_deliveryPriceController.text.isNotEmpty)
        'deliveryPrice': double.tryParse(_deliveryPriceController.text),
    },
  };

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (_isEditing) {
      context.read<AnnonceBloc>().add(
        AnnonceEvent.updateAnnonce(
          id: widget.annonce!.id,
          body: _buildBody(),
        ),
      );
    } else {
      context.read<AnnonceBloc>().add(
        AnnonceEvent.createAnnonceWithMedias(
          body: _buildBody(),
          photoPaths: _photos.map((x) => x.path).toList(),
        ),
      );
    }
  }

  List<Step> get _steps => [
    Step(
      title: const Text('Photos'),
      subtitle: const Text('Jusqu\'à 5 photos'),
      isActive: _currentStep >= 0,
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      content: _PhotoStep(
        photos: _photos,
        onAdd: _showPhotoOptions,
        onRemove: (i) => setState(() => _photos.removeAt(i)),
      ),
    ),
    Step(
      title: const Text('Animal'),
      subtitle: const Text('Race, âge, poids...'),
      isActive: _currentStep >= 1,
      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      content: _AnimalStep(
        breedController: _breedController,
        weightController: _weightController,
        ageController: _ageController,
        gender: _gender,
        eligibleForAid: _eligibleForAid,
        onGenderChanged: (g) => setState(() => _gender = g),
        onEligibleChanged: (v) => setState(() => _eligibleForAid = v),
      ),
    ),
    Step(
      title: const Text('Annonce'),
      subtitle: const Text('Titre, prix, description'),
      isActive: _currentStep >= 2,
      state: _currentStep > 2 ? StepState.complete : StepState.indexed,
      content: _AnnonceStep(
        titleController: _titleController,
        descriptionController: _descriptionController,
        priceController: _priceController,
        priceNegotiable: _priceNegotiable,
        onNegotiableChanged: (v) => setState(() => _priceNegotiable = v),
      ),
    ),
    Step(
      title: const Text('Localisation'),
      subtitle: const Text('Région, ville et livraison'),
      isActive: _currentStep >= 3,
      state: StepState.indexed,
      content: _LocationStep(
        selectedRegion: _selectedRegion,
        selectedCity: _selectedCity,
        addressController: _addressController,
        deliveryAvailable: _deliveryAvailable,
        deliveryRadiusController: _deliveryRadiusController,
        deliveryPriceController: _deliveryPriceController,
        onRegionChanged: (region) => setState(() {
          _selectedRegion = region;
          _selectedCity = null;
        }),
        onCityChanged: (city) => setState(() => _selectedCity = city),
        onDeliveryChanged: (v) => setState(() => _deliveryAvailable = v),
        onDetectLocation: _detectLocation,
        isLocating: _isLocating,
        hasLocation: _latitude != null,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnnonceBloc, AnnonceState>(
      listener: (context, state) {
        state.whenOrNull(
          annonceCreated: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Annonce publiée avec succès ✅'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          },
          annonceUpdated: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Annonce modifiée ✅')),
            );
            Navigator.of(context).pop();
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
        );
      },
      builder: (context, state) {
        final isUploadingMedias = state.maybeWhen(
          uploadingMedias: (_, __) => true,
          orElse: () => false,
        );
        final uploadCurrent = state.maybeWhen(
          uploadingMedias: (current, _) => current,
          orElse: () => 0,
        );
        final uploadTotal = state.maybeWhen(
          uploadingMedias: (_, total) => total,
          orElse: () => 0,
        );
        final isLoading =
            state == const AnnonceState.loading() || isUploadingMedias;

        return Scaffold(
          appBar: AppBar(
            title: Text(_isEditing ? 'Modifier' : 'Nouvelle annonce'),
            elevation: 0,
          ),
          body: Stack(
            children: [
              Form(
                key: _formKey,
                child: Stepper(
                  currentStep: _currentStep,
                  type: StepperType.vertical,
                  onStepTapped: (step) => setState(() => _currentStep = step),
                  onStepContinue: () {
                    if (_currentStep < _steps.length - 1) {
                      setState(() => _currentStep++);
                    } else {
                      _submit();
                    }
                  },
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() => _currentStep--);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  controlsBuilder: (context, details) {
                    final isLast = _currentStep == _steps.length - 1;
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          FilledButton(
                            onPressed: isLoading ? null : details.onStepContinue,
                            child: isLoading && isLast
                                ? const SizedBox(
                              height: 18, width: 18,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                                : Text(isLast ? 'Publier' : 'Suivant'),
                          ),
                          const SizedBox(width: 12),
                          TextButton(
                            onPressed: details.onStepCancel,
                            child: Text(
                                _currentStep == 0 ? 'Annuler' : 'Précédent'),
                          ),
                        ],
                      ),
                    );
                  },
                  steps: _steps,
                ),
              ),
              if (isUploadingMedias)
                Container(
                  color: Colors.black54,
                  child: Center(
                    child: Card(
                      margin: const EdgeInsets.all(32),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircularProgressIndicator(),
                            const SizedBox(height: 16),
                            Text(
                              'Upload photo $uploadCurrent / $uploadTotal',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: uploadTotal > 0
                                  ? uploadCurrent / uploadTotal
                                  : 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// ── Widgets steps ─────────────────────────────────────────────────────────────

class _PhotoStep extends StatelessWidget {
  final List<XFile> photos;
  final VoidCallback onAdd;
  final void Function(int) onRemove;

  const _PhotoStep({
    required this.photos,
    required this.onAdd,
    required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8,
          ),
          itemCount: photos.length + (photos.length < 5 ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == photos.length) {
              return GestureDetector(
                onTap: onAdd,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate_outlined,
                          size: 30, color: Colors.grey.shade500),
                      const SizedBox(height: 4),
                      Text('${photos.length}/5',
                          style: TextStyle(
                              fontSize: 11, color: Colors.grey.shade500)),
                    ],
                  ),
                ),
              );
            }
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(File(photos[index].path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity),
                ),
                if (index == 0)
                  Positioned(
                    bottom: 4, left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Text('Principale',
                          style: TextStyle(color: Colors.white, fontSize: 9)),
                    ),
                  ),
                Positioned(
                  top: 4, right: 4,
                  child: GestureDetector(
                    onTap: () => onRemove(index),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: const Icon(Icons.close,
                          color: Colors.white, size: 14),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        if (photos.isEmpty) ...[
          const SizedBox(height: 8),
          Text(
            'Ajoutez des photos pour attirer plus d\'acheteurs',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic),
          ),
        ],
      ],
    );
  }
}

class _AnimalStep extends StatelessWidget {
  final TextEditingController breedController;
  final TextEditingController weightController;
  final TextEditingController ageController;
  final AnimalGender? gender;
  final bool eligibleForAid;
  final ValueChanged<AnimalGender?> onGenderChanged;
  final ValueChanged<bool> onEligibleChanged;

  const _AnimalStep({
    required this.breedController,
    required this.weightController,
    required this.ageController,
    required this.gender,
    required this.eligibleForAid,
    required this.onGenderChanged,
    required this.onEligibleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FormField(
            controller: breedController,
            label: 'Race *',
            hint: 'ex: Sardi, Timahdite...',
            validator: (v) =>
            v == null || v.trim().isEmpty ? 'Race requise' : null),
        const SizedBox(height: 12),
        const Text('Genre',
            style: TextStyle(fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 6),
        SegmentedButton<AnimalGender?>(
          segments: const [
            ButtonSegment(value: null, label: Text('Non précisé')),
            ButtonSegment(
                value: AnimalGender.male,
                label: Text('Mâle'),
                icon: Icon(Icons.male, size: 16)),
            ButtonSegment(
                value: AnimalGender.female,
                label: Text('Femelle'),
                icon: Icon(Icons.female, size: 16)),
          ],
          selected: {gender},
          onSelectionChanged: (val) => onGenderChanged(val.first),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
                child: _FormField(
                    controller: weightController,
                    label: 'Poids (kg)',
                    hint: 'ex: 45',
                    keyboardType: TextInputType.number)),
            const SizedBox(width: 12),
            Expanded(
                child: _FormField(
                    controller: ageController,
                    label: 'Âge (mois)',
                    hint: 'ex: 8',
                    keyboardType: TextInputType.number)),
          ],
        ),
        SwitchListTile(
          title: const Text('Éligible aux aides agricoles'),
          value: eligibleForAid,
          onChanged: onEligibleChanged,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
      ],
    );
  }
}

class _AnnonceStep extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final bool priceNegotiable;
  final ValueChanged<bool> onNegotiableChanged;

  const _AnnonceStep({
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
        _FormField(
            controller: titleController,
            label: 'Titre *',
            hint: 'ex: Agneau Sardi de qualité',
            validator: (v) =>
            v == null || v.trim().isEmpty ? 'Titre requis' : null),
        const SizedBox(height: 12),
        _FormField(
            controller: priceController,
            label: 'Prix (MAD) *',
            hint: 'ex: 2500',
            keyboardType: TextInputType.number,
            validator: (v) =>
            double.tryParse(v ?? '') == null ? 'Prix invalide' : null),
        SwitchListTile(
          title: const Text('Prix négociable'),
          value: priceNegotiable,
          onChanged: onNegotiableChanged,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        _FormField(
            controller: descriptionController,
            label: 'Description',
            hint: 'Santé, alimentation, comportement...',
            maxLines: 4),
      ],
    );
  }
}

class _LocationStep extends StatelessWidget {
  final String? selectedRegion;
  final String? selectedCity;
  final TextEditingController addressController;
  final bool deliveryAvailable;
  final TextEditingController deliveryRadiusController;
  final TextEditingController deliveryPriceController;
  final ValueChanged<String?> onRegionChanged;
  final ValueChanged<String?> onCityChanged;
  final ValueChanged<bool> onDeliveryChanged;
  final VoidCallback onDetectLocation;
  final bool isLocating;
  final bool hasLocation;

  const _LocationStep({
    required this.selectedRegion,
    required this.selectedCity,
    required this.addressController,
    required this.deliveryAvailable,
    required this.deliveryRadiusController,
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
    final cities = selectedRegion != null
        ? kMoroccoRegionsAndCities[selectedRegion] ?? []
        : <String>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bouton GPS
        OutlinedButton.icon(
          onPressed: isLocating ? null : onDetectLocation,
          icon: isLocating
              ? const SizedBox(
            width: 16, height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
              : Icon(
            hasLocation ? Icons.my_location : Icons.location_searching,
            color: hasLocation ? Colors.green : null,
          ),
          label: Text(
            isLocating
                ? 'Détection en cours...'
                : hasLocation
                ? 'Position détectée ✅'
                : 'Détecter ma position',
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(44),
            side: BorderSide(
              color: hasLocation ? Colors.green : Colors.grey.shade400,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Dropdown Région
        DropdownButtonFormField<String>(
          value: selectedRegion,
          isExpanded: true,
          decoration: InputDecoration(
            labelText: 'Région *',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          hint: const Text('Sélectionner une région'),
          items: kMoroccoRegionsAndCities.keys
              .map((r) => DropdownMenuItem(value: r, child: Text(r)))
              .toList(),
          onChanged: onRegionChanged,
          validator: (v) => v == null ? 'Région requise' : null,
        ),
        const SizedBox(height: 12),

        // Dropdown Ville (filtré par région)
        DropdownButtonFormField<String>(
          value: selectedCity,
          isExpanded: true,
          decoration: InputDecoration(
            labelText: 'Ville',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          hint: Text(
            selectedRegion == null
                ? 'Sélectionnez d\'abord une région'
                : 'Sélectionner une ville',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
          ),
          items: cities
              .map((c) => DropdownMenuItem(value: c, child: Text(c)))
              .toList(),
          onChanged: selectedRegion == null ? null : onCityChanged,
        ),
        const SizedBox(height: 12),

        // Adresse libre
        _FormField(
            controller: addressController,
            label: 'Adresse (optionnel)',
            hint: 'ex: Ferme, route de Settat'),

        SwitchListTile(
          title: const Text('Livraison disponible'),
          value: deliveryAvailable,
          onChanged: onDeliveryChanged,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        if (deliveryAvailable) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  child: _FormField(
                      controller: deliveryRadiusController,
                      label: 'Rayon (km)',
                      hint: 'ex: 50',
                      keyboardType: TextInputType.number)),
              const SizedBox(width: 12),
              Expanded(
                  child: _FormField(
                      controller: deliveryPriceController,
                      label: 'Prix livraison (MAD)',
                      hint: 'ex: 150',
                      keyboardType: TextInputType.number)),
            ],
          ),
        ],
      ],
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    this.hint,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}