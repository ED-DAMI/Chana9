import 'package:flutter/material.dart';

class CreateAnnoncePage extends StatelessWidget {
  const CreateAnnoncePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Créer une annonce')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text('Formulaire de création d\'annonce'),
      ),
    );
  }
}
