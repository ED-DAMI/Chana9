import 'package:flutter/material.dart';

class AnnonceDetailPage extends StatelessWidget {
  const AnnonceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détail de l\'annonce')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text('Page de détail de l\'annonce'),
      ),
    );
  }
}
