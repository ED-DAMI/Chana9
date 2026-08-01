import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ma_chana9_app/core/l10n/app_localizations.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PhoneField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
      ],
      decoration: InputDecoration(
        labelText: l10n.t('phone_label'),
        hintText: '+212600000000',
        prefixIcon: const Icon(Icons.phone_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.t('phone_required');
            }
            final regex = RegExp(r'^\+?[0-9]{9,15}$');
            if (!regex.hasMatch(value.trim())) {
              return l10n.t('phone_invalid');
            }
            return null;
          },
    );
  }
}
