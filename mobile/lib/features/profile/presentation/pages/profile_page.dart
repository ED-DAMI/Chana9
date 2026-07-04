import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text('Informations de profil'),
      ),
    );
  }
}
