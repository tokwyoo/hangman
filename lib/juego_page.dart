import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';

class JuegoPage extends StatefulWidget {
  JuegoPage({super.key});
  final SettingsController settingsController =
  Get.find(); // Retrieve the controller

  @override
  _JuegoPageState createState() => _JuegoPageState();
}

class _JuegoPageState extends State<JuegoPage> {
  String archivoPalabras = 'assets/palabras.txt';
  List<String> palabras = [];
  String _palabra = "";
  String _espacios = "";
  int idxpalabra = 0;
  int _intentos = 0;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _cargaPalabras();
  }

  Future<void> _cargaPalabras() async {
    final String contenido = await rootBundle.loadString(archivoPalabras);
    setState(() {
      palabras = contenido.split('\n');
    });
  }

  void _setEspacios() {
    setState(() {
      if (palabras.isNotEmpty) {
        _palabra = palabras[idxpalabra];
        _espacios = "_ " * _palabra.length;
      } else {
        _palabra = "";
        _espacios = "";
      }
    });
  }

  void _nuevoJuego() {
    setState(() {});
    idxpalabra = _random.nextInt(palabras.length);
    _intentos = 0;
    _setEspacios();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Juego'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('ABC......')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 600,
                  child: Stack(
                    children: <Widget>[
                      widget.settingsController.showTemaSelectedBackground(300),
                      Positioned(
                        top: widget.settingsController.getTemaTop(_intentos),
                        left: widget.settingsController.getTemaLeft(_intentos),
                        child: Container(
                          width: 150,
                          child: widget.settingsController.showAhorcado(
                            _intentos,
                            350,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Text('_ _ _ _ _ _')
                Text(_espacios),
                Text(_palabra),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _nuevoJuego,
                  child: const Text('Nuevo Juego'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
