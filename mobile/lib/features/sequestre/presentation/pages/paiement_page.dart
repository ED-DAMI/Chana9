import 'package:flutter/material.dart';

class PaiementPage extends StatelessWidget {
  const PaiementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paiement sécurisé')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text('Page de séquestre / paiement'),
      ),
    );
  }
}
