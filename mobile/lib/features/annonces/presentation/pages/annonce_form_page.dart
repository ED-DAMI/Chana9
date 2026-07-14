import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _breedController;
  late final TextEditingController _priceController;
  late final TextEditingController _regionController;
  late final TextEditingController _weightController;
  late final TextEditingController _deliveryRadiusController;
  late final TextEditingController _deliveryPriceController;

  bool _priceNegotiable = false;
  bool _eligibleForAid = false;
  bool _deliveryAvailable = false;
  AnimalGender? _gender;

  bool get _isEditing => widget.annonce != null;

  @override
  void initState() {
    super.initState();
    final a = widget.annonce;
    _titleController = TextEditingController(text: a?.title ?? '');
    _descriptionController =
        TextEditingController(text: a?.description ?? '');
    _breedController = TextEditingController(text: a?.breed ?? '');
    _priceController =
        TextEditingController(text: a?.price.toString() ?? '');
    _regionController = TextEditingController(text: a?.region ?? '');
    _weightController =
        TextEditingController(text: a?.estimatedWeight?.toString() ?? '');
    _deliveryRadiusController =
        TextEditingController(text: a?.deliveryRadiusKm?.toString() ?? '');
    _deliveryPriceController =
        TextEditingController(text: a?.deliveryPrice?.toString() ?? '');
    _priceNegotiable = a?.priceNegotiable ?? false;
    _eligibleForAid = a?.eligibleForAid ?? false;
    _deliveryAvailable = a?.deliveryAvailable ?? false;
    _gender = a?.gender;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _breedController.dispose();
    _priceController.dispose();
    _regionController.dispose();
    _weightController.dispose();
    _deliveryRadiusController.dispose();
    _deliveryPriceController.dispose();
    super.dispose();
  }

  Map<String, dynamic> _buildBody() {
    return {
      'title': _titleController.text.trim(),
      'description': _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      'breed': _breedController.text.trim(),
      'price': double.tryParse(_priceController.text),
      'priceNegotiable': _priceNegotiable,
      'region': _regionController.text.trim(),
      'estimatedWeight': double.tryParse(_weightController.text),
      'eligibleForAid': _eligibleForAid,
      'deliveryAvailable': _deliveryAvailable,
      if (_deliveryAvailable) ...{
        'deliveryRadiusKm':
            int.tryParse(_deliveryRadiusController.text),
        'deliveryPrice':
            double.tryParse(_deliveryPriceController.text),
      },
      if (_gender != null) 'gender': _gender!.name,
    };
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final body = _buildBody();
    if (_isEditing) {
      context
          .read<AnnonceBloc>()
          .add(AnnonceEvent.updateAnnonce(id: widget.annonce!.id, body: body));
    } else {
      context.read<AnnonceBloc>().add(AnnonceEvent.createAnnonce(body));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnnonceBloc, AnnonceState>(
      listener: (context, state) {
        state.whenOrNull(
          annonceCreated: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Annonce créée avec succès')),
            );
            Navigator.of(context).pop();
          },
          annonceUpdated: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Annonce modifiée avec succès')),
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(_isEditing ? 'Modifier l\'annonce' : 'Nouvelle annonce'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _FormField(
                controller: _titleController,
                label: 'Titre *',
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Titre requis' : null,
              ),
              const SizedBox(height: 16),
              _FormField(
                controller: _breedController,
                label: 'Race *',
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Race requise' : null,
              ),
              const SizedBox(height: 16),
              _FormField(
                controller: _descriptionController,
                label: 'Description',
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _FormField(
                      controller: _priceController,
                      label: 'Prix (MAD) *',
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          double.tryParse(v ?? '') == null ? 'Prix invalide' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _FormField(
                      controller: _weightController,
                      label: 'Poids (kg)',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _FormField(
                controller: _regionController,
                label: 'Région *',
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Région requise' : null,
              ),
              const SizedBox(height: 16),
              Text('Genre',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SegmentedButton<AnimalGender?>(
                segments: const [
                  ButtonSegment(value: null, label: Text('Non précisé')),
                  ButtonSegment(
                      value: AnimalGender.male, label: Text('Mâle')),
                  ButtonSegment(
                      value: AnimalGender.female, label: Text('Femelle')),
                ],
                selected: {_gender},
                onSelectionChanged: (val) =>
                    setState(() => _gender = val.first),
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('Prix négociable'),
                value: _priceNegotiable,
                onChanged: (v) => setState(() => _priceNegotiable = v),
                contentPadding: EdgeInsets.zero,
              ),
              SwitchListTile(
                title: const Text('Éligible aux aides'),
                value: _eligibleForAid,
                onChanged: (v) => setState(() => _eligibleForAid = v),
                contentPadding: EdgeInsets.zero,
              ),
              SwitchListTile(
                title: const Text('Livraison disponible'),
                value: _deliveryAvailable,
                onChanged: (v) => setState(() => _deliveryAvailable = v),
                contentPadding: EdgeInsets.zero,
              ),
              if (_deliveryAvailable) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _FormField(
                        controller: _deliveryRadiusController,
                        label: 'Rayon (km)',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _FormField(
                        controller: _deliveryPriceController,
                        label: 'Prix livraison (MAD)',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 32),
              BlocBuilder<AnnonceBloc, AnnonceState>(
                builder: (context, state) {
                  final isLoading = state == const AnnonceState.loading();
                  return FilledButton(
                    onPressed: isLoading ? null : _submit,
                    style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(52)),
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white),
                          )
                        : Text(_isEditing ? 'Enregistrer' : 'Publier'),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
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
        border: const OutlineInputBorder(),
      ),
    );
  }
}
