import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum TemaJuego { base, futurista, lobito, hello_kitty, kirby }

class SettingsController extends GetxController {
  var tema = 0;

  Map<String, String> temaBase = {
    'nombre': 'Base',
    'background': './../assets/base/background.png',
    'top': '6',
    'left': '230',
  };
  Map<String, String> temaFuturista = {
    'nombre': 'Futurista',
    'background': './../assets/futurista/background.png',
    'top': '6',
    'left': '230',
  };
  Map<String, String> temaLobito = {
    'nombre': 'Lobito',
    'background': './../assets/lobito/background.png',
    'top': '6',
    'left': '230',
  };
  Map<String, String> temaHelloKitty = {
    'nombre': 'Hello_Kitty',
    'background': './../assets/hello_kitty/background.png',
    'top': '6',
    'left': '230',
  };
  Map<String, String> temaKirby = {
    'nombre': 'Kirby',
    'background': './../assets/kirby/background.png',
    'top': '6',
    'left': '230',
  };

  List<Map<String, String>> get temas => [temaBase, temaFuturista, temaLobito, temaHelloKitty, temaKirby];
  actualizaTema(int nuevoTema) {
    if (nuevoTema >= 0 && nuevoTema < 5) {
      tema = nuevoTema;
      update();
    }
  }

  int getTema() {
    return tema;
  }

  Image showTemaBackground(int index, double h) {
    Map<String, String> temaActual = temas[index];
    String background = temaActual['background']!; // ! check null
    return Image.asset(background, height: h);
  }

  Image showTemaSelectedBackground(double h) {
    Map<String, String> temaActual = temas[tema];
    String background = temaActual['background']!; // ! check null
    return Image.asset(background, height: h);
  }

  Image showAhorcado(int indice, double h) {
    Map<String, String> temaActual = temas[tema];
    String nombreTema = temaActual['nombre']!; // ! check null
    String imagenAhorcado = '${nombreTema.toLowerCase()}/$indice.png';
    //return imagenAhorcado;
    return Image.asset(imagenAhorcado, height: h);
  }

  String getTemaNombre(int indice) {
    Map<String, String> temaActual = temas[indice];
    return temaActual['nombre']!;
  }

  double getTemaTop(int indice) {
    Map<String, String> temaActual = temas[tema];
    return double.parse(temaActual['top']!);
  }

  double getTemaLeft(int indice) {
    Map<String, String> temaActual = temas[tema];
    ;
    return double.parse(temaActual['left']!);
  }
}