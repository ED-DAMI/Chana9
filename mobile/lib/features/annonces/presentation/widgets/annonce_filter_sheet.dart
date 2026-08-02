import 'package:flutter/material.dart';
import 'package:ma_chana9_app/shared/enums/animal_breed.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/localization/locale_labels.dart';
import '../../data/models/annonce_search_request_model.dart';

const _moroccanRegions = [
  'Tanger-Tétouan-Al Hoceïma',
  'Oriental',
  'Fès-Meknès',
  'Rabat-Salé-Kénitra',
  'Béni Mellal-Khénifra',
  'Casablanca-Settat',
  'Marrakech-Safi',
  'Drâa-Tafilalet',
  'Souss-Massa',
  'Guelmim-Oued Noun',
  'Laâyoune-Sakia El Hamra',
  'Dakhla-Oued Ed-Dahab',
];

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
  late final TextEditingController _minPriceController;
  late final TextEditingController _maxPriceController;
  late final TextEditingController _minWeightController;
  late final TextEditingController _maxWeightController;

  AnimalBreed? _selectedBreed;
  String? _selectedRegion;
  AnimalGender? _gender;
  bool? _deliveryAvailable;
  bool? _priceNegotiable;
  bool? _eligibleForAid;
  bool? _topLotOnly;

  @override
  void initState() {
    super.initState();
    final f = widget.initialFilter;
    _minPriceController = TextEditingController(text: f.minPrice?.toString() ?? '');
    _maxPriceController = TextEditingController(text: f.maxPrice?.toString() ?? '');
    _minWeightController = TextEditingController(text: f.minWeight?.toString() ?? '');
    _maxWeightController = TextEditingController(text: f.maxWeight?.toString() ?? '');
    _selectedRegion = f.region;
    _gender = f.gender;
    _deliveryAvailable = f.deliveryAvailable;
    _priceNegotiable = f.priceNegotiable;
    _eligibleForAid = f.eligibleForAid;
    _topLotOnly = f.topLotOnly;
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    _minWeightController.dispose();
    _maxWeightController.dispose();
    super.dispose();
  }

  void _reset() {
    setState(() {
      _selectedBreed = null;
      _selectedRegion = null;
      _minPriceController.clear();
      _maxPriceController.clear();
      _minWeightController.clear();
      _maxWeightController.clear();
      _gender = null;
      _deliveryAvailable = null;
      _priceNegotiable = null;
      _eligibleForAid = null;
      _topLotOnly = null;
    });
  }

  void _apply() {
    widget.onApply(AnnonceSearchRequestModel(
      breed: _selectedBreed?.backendValue,
      region: _selectedRegion,
      minPrice: double.tryParse(_minPriceController.text),
      maxPrice: double.tryParse(_maxPriceController.text),
      minWeight: double.tryParse(_minWeightController.text),
      maxWeight: double.tryParse(_maxWeightController.text),
      gender: _gender,
      deliveryAvailable: _deliveryAvailable,
      priceNegotiable: _priceNegotiable,
      eligibleForAid: _eligibleForAid,
      topLotOnly: _topLotOnly,
    ));
    Navigator.of(context).pop();
  }

  String _breedLabel(BuildContext context, AnimalBreed breed) {
    final l10n = AppLocalizations.of(context)!;
    final labels = {
      AnimalBreed.sardi: l10n.sardi,
      AnimalBreed.timahdite: l10n.timahdite,
      AnimalBreed.beniGuil: l10n.beniGuil,
      AnimalBreed.dokkali: l10n.dokkali,
      AnimalBreed.rehami: l10n.rehami,
      AnimalBreed.boujaad: l10n.boujaad,
      AnimalBreed.oulmesZaer: l10n.oulmesZaer,
      AnimalBreed.beniAhsen: l10n.beniAhsen,
      AnimalBreed.daMan: l10n.daMan,
      AnimalBreed.draa: l10n.draa,
      AnimalBreed.naineDeMontagne: l10n.naineDeMontagne,
      AnimalBreed.chevreduRiff: l10n.chevreduRiff,
      AnimalBreed.chevreDeLaayoune: l10n.chevreDeLaayoune,
      AnimalBreed.blondeDAquitaine: l10n.blondeDAquitaine,
      AnimalBreed.frisonnePieNoire: l10n.frisonnePieNoire,
      AnimalBreed.montbeliarde: l10n.montbeliarde,
      AnimalBreed.bruneAtlas: l10n.bruneAtlas,
      AnimalBreed.ougda: l10n.ougda,
      AnimalBreed.dromadaireSahraouii: l10n.dromadaireSahraouii,
      AnimalBreed.dromadaireGuelmim: l10n.dromadaireGuelmim,
      AnimalBreed.barbe: l10n.barbe,
      AnimalBreed.arabeBarbe: l10n.arabeBarbe,
      AnimalBreed.aneBeldi: l10n.aneBeldi,
      AnimalBreed.mulet: l10n.mulet,
      AnimalBreed.other: l10n.other,
    };
    return labels[breed] ?? breed.name;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Text(
                      l10n.filterAnnonces,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(onPressed: _reset, child: Text(l10n.resetFilters)),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    _SectionTitle(title: l10n.breed),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: AnimalBreed.values.map((breed) {
                        final selected = _selectedBreed == breed;
                        return FilterChip(
                          label: Text(_breedLabel(context, breed)),
                          selected: selected,
                          onSelected: (_) => setState(() {
                            _selectedBreed = selected ? null : breed;
                          }),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    _SectionTitle(title: l10n.region),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                        children: _moroccanRegions.map((region) {
                          final selected = _selectedRegion == region;
                          return FilterChip(
                            label: Text(localizedRegion(context, region)),
                            selected: selected,
                            onSelected: (_) => setState(() {
                              _selectedRegion = selected ? null : region;
                            }),
                          );
                        }).toList(),
                    ),
                    const SizedBox(height: 20),
                    _SectionTitle(title: l10n.price),
                    Row(
                      children: [
                        Expanded(
                          child: _FilterTextField(
                            controller: _minPriceController,
                            label: l10n.min,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _FilterTextField(
                            controller: _maxPriceController,
                            label: l10n.max,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _SectionTitle(title: l10n.weight_kg),
                    Row(
                      children: [
                        Expanded(
                          child: _FilterTextField(
                            controller: _minWeightController,
                            label: l10n.min,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _FilterTextField(
                            controller: _maxWeightController,
                            label: l10n.max,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _SectionTitle(title: l10n.gender),
                    SegmentedButton<AnimalGender?>(
                      segments: [
                        ButtonSegment(value: null, label: Text(l10n.all)),
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
                      selected: {_gender},
                      onSelectionChanged: (val) =>
                          setState(() => _gender = val.first),
                    ),
                    const SizedBox(height: 20),
                    _SectionTitle(title: l10n.options),
                    _FilterSwitch(
                      label: l10n.deliveryAvailable,
                      icon: Icons.local_shipping_outlined,
                      value: _deliveryAvailable ?? false,
                      onChanged: (v) =>
                          setState(() => _deliveryAvailable = v ? true : null),
                    ),
                    _FilterSwitch(
                      label: l10n.priceNegotiable,
                      icon: Icons.handshake_outlined,
                      value: _priceNegotiable ?? false,
                      onChanged: (v) =>
                          setState(() => _priceNegotiable = v ? true : null),
                    ),
                    _FilterSwitch(
                      label: l10n.eligibleForAid,
                      icon: Icons.verified_outlined,
                      value: _eligibleForAid ?? false,
                      onChanged: (v) =>
                          setState(() => _eligibleForAid = v ? true : null),
                    ),
                    _FilterSwitch(
                      label: l10n.topLotOnly,
                      icon: Icons.star_outlined,
                      value: _topLotOnly ?? false,
                      onChanged: (v) =>
                          setState(() => _topLotOnly = v ? true : null),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16,
                  8,
                  16,
                  MediaQuery.of(context).padding.bottom + 16,
                ),
                child: FilledButton(
                  onPressed: _apply,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    l10n.applyFilters,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade700,
        ),
      ),
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}

class _FilterSwitch extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _FilterSwitch({
    required this.label,
    required this.icon,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}