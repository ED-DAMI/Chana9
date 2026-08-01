import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma_chana9_app/shared/enums/report_reason.dart';
import '../bloc/annonce_detail_bloc.dart';

class ReportSheet extends StatefulWidget {
  final String annonceId;

  const ReportSheet({super.key, required this.annonceId});

  @override
  State<ReportSheet> createState() => _ReportSheetState();
}

class _ReportSheetState extends State<ReportSheet> {
  ReportReason? _selectedReason;
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_selectedReason == null) return;
    context.read<AnnonceDetailBloc>().add(AnnonceDetailEvent.report(
      id: widget.annonceId,
      reason: _selectedReason!.value,
      comment: _commentController.text.trim().isEmpty
          ? null
          : _commentController.text.trim(),
    ));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<AnnonceDetailBloc, AnnonceDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          actionSuccess: (_) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signalement envoyé')),
          ),
          failure: (message) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: Colors.orange),
          ),
          orElse: () {},
        );
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
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
                  child: Text(
                    'Signaler l\'annonce',
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    children: [
                      ...ReportReason.values.map((reason) {
                        return RadioListTile<ReportReason>(
                          title: Text(reason.value),
                          value: reason,
                          groupValue: _selectedReason,
                          onChanged: (v) => setState(() => _selectedReason = v),
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                        );
                      }),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _commentController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Commentaire (optionnel)',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: const EdgeInsets.all(12),
                        ),
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
                    onPressed: _selectedReason != null ? _submit : null,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                      backgroundColor: Colors.red.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Envoyer le signalement',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}