import 'package:flutter/material.dart';
import 'package:login_test/src/pages/side_bar.dart';

class Agregar extends StatefulWidget {
  const Agregar({super.key});

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar'),
      ),
      drawer: const NavBar(),
      body: const Center(),
    );
  }
}
