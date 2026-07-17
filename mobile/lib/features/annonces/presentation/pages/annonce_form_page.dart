import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';
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

  // Photos
  final List<XFile> _photos = [];
  final ImagePicker _picker = ImagePicker();

  // Étape 1 — Animal
  final _breedController = TextEditingController();
  AnimalGender? _gender;
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  bool _eligibleForAid = false;

  // Étape 2 — Annonce
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  bool _priceNegotiable = false;

  // Étape 3 — Localisation & livraison
  final _regionController = TextEditingController();
  final _addressController = TextEditingController();
  bool _deliveryAvailable = false;
  final _deliveryRadiusController = TextEditingController();
  final _deliveryPriceController = TextEditingController();

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
    _regionController.text = a.region;
    _addressController.text = a.addressLabel ?? '';
    _deliveryAvailable = a.deliveryAvailable;
    _deliveryRadiusController.text = a.deliveryRadiusKm?.toString() ?? '';
    _deliveryPriceController.text = a.deliveryPrice?.toString() ?? '';
  }

  @override
  void dispose() {
    _breedController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _regionController.dispose();
    _addressController.dispose();
    _deliveryRadiusController.dispose();
    _deliveryPriceController.dispose();
    super.dispose();
  }

  // ── Photos ──────────────────────────────────────────────────────────────

  Future<void> _pickFromGallery() async {
    final images = await _picker.pickMultiImage(imageQuality: 80);
    if (images.isNotEmpty) {
      setState(() {
        final remaining = 5 - _photos.length;
        _photos.addAll(images.take(remaining));
      });
    }
  }

  Future<void> _pickFromCamera() async {
    final image =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (image != null && _photos.length < 5) {
      setState(() => _photos.add(image));
    }
  }

  void _removePhoto(int index) {
    setState(() => _photos.removeAt(index));
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
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choisir depuis la galerie'),
              subtitle: const Text('Jusqu\'à 5 photos'),
              onTap: () {
                Navigator.pop(context);
                _pickFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Prendre une photo'),
              onTap: () {
                Navigator.pop(context);
                _pickFromCamera();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // ── Soumission ──────────────────────────────────────────────────────────

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final body = <String, dynamic>{
      'title': _titleController.text.trim(),
      'breed': _breedController.text.trim(),
      'price': double.tryParse(_priceController.text),
      'priceNegotiable': _priceNegotiable,
      'region': _regionController.text.trim(),
      'eligibleForAid': _eligibleForAid,
      'deliveryAvailable': _deliveryAvailable,
      if (_descriptionController.text.trim().isNotEmpty)
        'description': _descriptionController.text.trim(),
      if (_gender != null) 'gender': _gender!.name.toUpperCase(),
      if (_weightController.text.isNotEmpty)
        'estimatedWeight': double.tryParse(_weightController.text),
      if (_ageController.text.isNotEmpty)
        'ageMonths': int.tryParse(_ageController.text),
      if (_addressController.text.trim().isNotEmpty)
        'addressLabel': _addressController.text.trim(),
      if (_deliveryAvailable) ...{
        if (_deliveryRadiusController.text.isNotEmpty)
          'deliveryRadiusKm': int.tryParse(_deliveryRadiusController.text),
        if (_deliveryPriceController.text.isNotEmpty)
          'deliveryPrice': double.tryParse(_deliveryPriceController.text),
      },
    };

    if (_isEditing) {
      context.read<AnnonceBloc>().add(
        AnnonceEvent.updateAnnonce(id: widget.annonce!.id, body: body),
      );
    } else {
      context.read<AnnonceBloc>().add(AnnonceEvent.createAnnonce(body));
    }
  }

  // ── Steps ───────────────────────────────────────────────────────────────

  List<Step> get _steps => [
    Step(
      title: const Text('Photos'),
      subtitle: const Text('Jusqu\'à 5 photos'),
      isActive: _currentStep >= 0,
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      content: _PhotoStep(
        photos: _photos,
        onAdd: _showPhotoOptions,
        onRemove: _removePhoto,
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
      subtitle: const Text('Région et livraison'),
      isActive: _currentStep >= 3,
      state: StepState.indexed,
      content: _LocationStep(
        regionController: _regionController,
        addressController: _addressController,
        deliveryAvailable: _deliveryAvailable,
        deliveryRadiusController: _deliveryRadiusController,
        deliveryPriceController: _deliveryPriceController,
        onDeliveryChanged: (v) => setState(() => _deliveryAvailable = v),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnnonceBloc, AnnonceState>(
      listener: (context, state) {
        state.whenOrNull(
          annonceCreated: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Annonce publiée ✅')),
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
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_isEditing ? 'Modifier l\'annonce' : 'Nouvelle annonce'),
          elevation: 0,
        ),
        body: Form(
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
                      onPressed: details.onStepContinue,
                      child: BlocBuilder<AnnonceBloc, AnnonceState>(
                        builder: (context, state) {
                          final loading = state == const AnnonceState.loading();
                          if (loading && isLast) {
                            return const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            );
                          }
                          return Text(isLast ? 'Publier' : 'Suivant');
                        },
                      ),
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
      ),
    );
  }
}

// ── Étape 1 : Photos ────────────────────────────────────────────────────────

class _PhotoStep extends StatelessWidget {
  final List<XFile> photos;
  final VoidCallback onAdd;
  final void Function(int) onRemove;

  const _PhotoStep({
    required this.photos,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Grille photos
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: photos.length + (photos.length < 5 ? 1 : 0),
          itemBuilder: (context, index) {
            // Bouton ajouter
            if (index == photos.length) {
              return GestureDetector(
                onTap: onAdd,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate_outlined,
                          size: 30, color: Colors.grey.shade500),
                      const SizedBox(height: 4),
                      Text(
                        '${photos.length}/5',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Photo ajoutée
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(photos[index].path),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                // Badge "principale" sur la première photo
                if (index == 0)
                  Positioned(
                    bottom: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Principale',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ),
                // Bouton supprimer
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () => onRemove(index),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
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
            'Ajoutez au moins une photo pour attirer plus d\'acheteurs',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }
}

// ── Étape 2 : Animal ────────────────────────────────────────────────────────

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
          hint: 'ex: Sardi, Timahdite, Boujad...',
          validator: (v) =>
          v == null || v.trim().isEmpty ? 'Race requise' : null,
        ),
        const SizedBox(height: 12),

        // Genre
        const Text('Genre',
            style: TextStyle(fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 6),
        SegmentedButton<AnimalGender?>(
          segments: const [
            ButtonSegment(value: null, label: Text('Non précisé')),
            ButtonSegment(
              value: AnimalGender.male,
              label: Text('Mâle'),
              icon: Icon(Icons.male, size: 16),
            ),
            ButtonSegment(
              value: AnimalGender.female,
              label: Text('Femelle'),
              icon: Icon(Icons.female, size: 16),
            ),
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
                label: 'Poids estimé (kg)',
                hint: 'ex: 45',
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _FormField(
                controller: ageController,
                label: 'Âge (mois)',
                hint: 'ex: 8',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        SwitchListTile(
          title: const Text('Éligible aux aides agricoles'),
          subtitle: const Text('Subvention de l\'État',
              style: TextStyle(fontSize: 12)),
          value: eligibleForAid,
          onChanged: onEligibleChanged,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
      ],
    );
  }
}

// ── Étape 3 : Annonce ───────────────────────────────────────────────────────

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FormField(
          controller: titleController,
          label: 'Titre *',
          hint: 'ex: Agneau Sardi de qualité supérieure',
          validator: (v) =>
          v == null || v.trim().isEmpty ? 'Titre requis' : null,
        ),
        const SizedBox(height: 12),

        _FormField(
          controller: priceController,
          label: 'Prix (MAD) *',
          hint: 'ex: 2500',
          keyboardType: TextInputType.number,
          validator: (v) =>
          double.tryParse(v ?? '') == null ? 'Prix invalide' : null,
        ),
        const SizedBox(height: 4),

        SwitchListTile(
          title: const Text('Prix négociable'),
          value: priceNegotiable,
          onChanged: onNegotiableChanged,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        const SizedBox(height: 8),

        _FormField(
          controller: descriptionController,
          label: 'Description',
          hint:
          'Décrivez l\'animal : santé, alimentation, comportement...',
          maxLines: 4,
        ),
      ],
    );
  }
}

// ── Étape 4 : Localisation ──────────────────────────────────────────────────

class _LocationStep extends StatelessWidget {
  final TextEditingController regionController;
  final TextEditingController addressController;
  final bool deliveryAvailable;
  final TextEditingController deliveryRadiusController;
  final TextEditingController deliveryPriceController;
  final ValueChanged<bool> onDeliveryChanged;

  const _LocationStep({
    required this.regionController,
    required this.addressController,
    required this.deliveryAvailable,
    required this.deliveryRadiusController,
    required this.deliveryPriceController,
    required this.onDeliveryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FormField(
          controller: regionController,
          label: 'Région *',
          hint: 'ex: Casablanca-Settat',
          validator: (v) =>
          v == null || v.trim().isEmpty ? 'Région requise' : null,
        ),
        const SizedBox(height: 12),

        _FormField(
          controller: addressController,
          label: 'Adresse (optionnel)',
          hint: 'ex: Ferme, route de Settat',
        ),
        const SizedBox(height: 8),

        SwitchListTile(
          title: const Text('Livraison disponible'),
          subtitle: const Text('Je peux livrer l\'animal',
              style: TextStyle(fontSize: 12)),
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
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FormField(
                  controller: deliveryPriceController,
                  label: 'Prix livraison (MAD)',
                  hint: 'ex: 150',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

// ── Widget réutilisable ──────────────────────────────────────────────────────

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
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
      ),
    );
  }
}