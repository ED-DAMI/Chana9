import 'package:flutter/material.dart';

class AnnoncesListPage extends StatelessWidget {
  const AnnoncesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Annonces')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => const ListTile(
          title: Text('Annonce'),
          subtitle: Text('Description de l\'annonce'),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: 3,
      ),
    );
  }
}
