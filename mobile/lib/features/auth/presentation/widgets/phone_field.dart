import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
      ],
      decoration: InputDecoration(
        labelText: 'Téléphone',
        hintText: '+212600000000',
        prefixIcon: const Icon(Icons.phone_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Le numéro de téléphone est requis';
            }
            final regex = RegExp(r'^\+?[0-9]{9,15}$');
            if (!regex.hasMatch(value.trim())) {
              return 'Numéro de téléphone invalide';
            }
            return null;
          },
    );
  }
}
