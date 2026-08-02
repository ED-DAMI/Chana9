import 'package:flutter/material.dart';
import 'package:ma_chana9_app/l10n/app_localizations.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    required this.controller,
    this.label,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      decoration: InputDecoration(
        labelText: widget.label ?? l10n.password,
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return l10n.passwordRequired;
            }
            if (value.length < 6) {
              return l10n.passwordMinLength;
            }
            return null;
          },
    );
  }
}
