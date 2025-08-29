import 'package:flutter/material.dart';

class JuegoPage extends StatefulWidget {
  const JuegoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JuegoPageState createState() => _JuegoPageState();
}

class _JuegoPageState extends State<JuegoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego'),
      ),
      body: const Center(
        child: Text('This is the Juego page'),
      ),
    );
  }
}
