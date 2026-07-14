import 'package:flutter/material.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';
import '../../data/models/annonce_search_request_model.dart';

class AnnonceFilterSheet extends StatefulWidget {
  final AnnonceSearchRequestModel initialFilter;
  final ValueChanged<AnnonceSearchRequestModel> onApply;

  const AnnonceFilterSheet({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

  @override
  State<AnnonceFilterSheet> createState() => _AnnonceFilterSheetState();
}

class _AnnonceFilterSheetState extends State<AnnonceFilterSheet> {
  late String? _breed;
  late String? _region;
  late double? _minPrice;
  late double? _maxPrice;
  late double? _minWeight;
  late double? _maxWeight;
  late AnimalGender? _gender;
  late bool? _deliveryAvailable;
  late bool? _priceNegotiable;
  late bool? _eligibleForAid;
  late bool? _topLotOnly;

  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();
  final _minWeightController = TextEditingController();
  final _maxWeightController = TextEditingController();
  final _breedController = TextEditingController();
  final _regionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final f = widget.initialFilter;
    _breed = f.breed;
    _region = f.region;
    _minPrice = f.minPrice;
    _maxPrice = f.maxPrice;
    _minWeight = f.minWeight;
    _maxWeight = f.maxWeight;
    _gender = f.gender;
    _deliveryAvailable = f.deliveryAvailable;
    _priceNegotiable = f.priceNegotiable;
    _eligibleForAid = f.eligibleForAid;
    _topLotOnly = f.topLotOnly;

    _breedController.text = _breed ?? '';
    _regionController.text = _region ?? '';
    _minPriceController.text = _minPrice?.toString() ?? '';
    _maxPriceController.text = _maxPrice?.toString() ?? '';
    _minWeightController.text = _minWeight?.toString() ?? '';
    _maxWeightController.text = _maxWeight?.toString() ?? '';
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    _minWeightController.dispose();
    _maxWeightController.dispose();
    _breedController.dispose();
    _regionController.dispose();
    super.dispose();
  }

  void _apply() {
    final filter = AnnonceSearchRequestModel(
      breed: _breedController.text.trim().isEmpty
          ? null
          : _breedController.text.trim(),
      region: _regionController.text.trim().isEmpty
          ? null
          : _regionController.text.trim(),
      minPrice: double.tryParse(_minPriceController.text),
      maxPrice: double.tryParse(_maxPriceController.text),
      minWeight: double.tryParse(_minWeightController.text),
      maxWeight: double.tryParse(_maxWeightController.text),
      gender: _gender,
      deliveryAvailable: _deliveryAvailable,
      priceNegotiable: _priceNegotiable,
      eligibleForAid: _eligibleForAid,
      topLotOnly: _topLotOnly,
    );
    widget.onApply(filter);
    Navigator.of(context).pop();
  }

  void _reset() {
    setState(() {
      _breed = null;
      _region = null;
      _minPrice = null;
      _maxPrice = null;
      _minWeight = null;
      _maxWeight = null;
      _gender = null;
      _deliveryAvailable = null;
      _priceNegotiable = null;
      _eligibleForAid = null;
      _topLotOnly = null;
      _breedController.clear();
      _regionController.clear();
      _minPriceController.clear();
      _maxPriceController.clear();
      _minWeightController.clear();
      _maxWeightController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Text('Filtres',
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    TextButton(onPressed: _reset, child: const Text('Réinitialiser')),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    _SectionTitle(title: 'Race & Région'),
                    _FilterTextField(
                      controller: _breedController,
                      label: 'Race',
                      hint: 'ex: Sardi, Timahdite...',
                    ),
                    const SizedBox(height: 12),
                    _FilterTextField(
                      controller: _regionController,
                      label: 'Région',
                      hint: 'ex: Casablanca-Settat',
                    ),
                    const SizedBox(height: 20),
                    _SectionTitle(title: 'Prix (MAD)'),
                    Row(
                      children: [
                        Expanded(
                          child: _FilterTextField(
                            controller: _minPriceController,
                            label: 'Min',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _FilterTextField(
                            controller: _maxPriceController,
                            label: 'Max',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _SectionTitle(title: 'Poids (kg)'),
                    Row(
                      children: [
                        Expanded(
                          child: _FilterTextField(
                            controller: _minWeightController,
                            label: 'Min',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _FilterTextField(
                            controller: _maxWeightController,
                            label: 'Max',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _SectionTitle(title: 'Genre'),
                    SegmentedButton<AnimalGender?>(
                      segments: const [
                        ButtonSegment(value: null, label: Text('Tous')),
                        ButtonSegment(
                            value: AnimalGender.male, label: Text('Mâle')),
                        ButtonSegment(
                            value: AnimalGender.female, label: Text('Femelle')),
                      ],
                      selected: {_gender},
                      onSelectionChanged: (val) =>
                          setState(() => _gender = val.first),
                    ),
                    const SizedBox(height: 20),
                    _SectionTitle(title: 'Options'),
                    _FilterCheckbox(
                      label: 'Livraison disponible',
                      value: _deliveryAvailable,
                      onChanged: (v) =>
                          setState(() => _deliveryAvailable = v ? true : null),
                    ),
                    _FilterCheckbox(
                      label: 'Prix négociable',
                      value: _priceNegotiable,
                      onChanged: (v) =>
                          setState(() => _priceNegotiable = v ? true : null),
                    ),
                    _FilterCheckbox(
                      label: 'Éligible aux aides',
                      value: _eligibleForAid,
                      onChanged: (v) =>
                          setState(() => _eligibleForAid = v ? true : null),
                    ),
                    _FilterCheckbox(
                      label: 'Top Lot uniquement',
                      value: _topLotOnly,
                      onChanged: (v) =>
                          setState(() => _topLotOnly = v ? true : null),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    16, 8, 16, MediaQuery.of(context).padding.bottom + 16),
                child: FilledButton(
                  onPressed: _apply,
                  style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(52)),
                  child: const Text('Appliquer les filtres'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
    );
  }
}

class _FilterTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType? keyboardType;

  const _FilterTextField({
    required this.controller,
    required this.label,
    this.hint,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
    );
  }
}

class _FilterCheckbox extends StatelessWidget {
  final String label;
  final bool? value;
  final ValueChanged<bool> onChanged;

  const _FilterCheckbox({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(label),
      value: value ?? false,
      onChanged: (v) => onChanged(v ?? false),
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
