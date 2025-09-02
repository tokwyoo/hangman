import 'package:get/get.dart';
import 'package:flutter/material.dart';
enum TemaJuego { base, futurista, terror }
class SettingsController extends GetxController {
  var tema = 0;
  Map<String,String> temaBase = { 'nombre':'Base', 'background':'./../assets/base/background.png'};
  Map<String,String> temaFuturista = { 'nombre':'Futurista', 'background':'./../assets/futurista/background.png'};
  Map<String,String> temaTerror = { 'nombre':'Terror','background':'./../assets/terror/background.png'};

  List<Map<String,String>> get temas => [temaBase, temaFuturista, temaTerror];
  actualizaTema(int nuevoTema) {
    if (nuevoTema>=0 && nuevoTema<3) {
      tema = nuevoTema;
      update();
    }
  }
  int getTema() {
    return tema;
  }
  Image showTemaBackground(int index, double h) {
    Map<String,String> temaActual = temas[index];
    String background = temaActual['background']!; // ! check null
    return Image.asset(background, height:h,);
  }
  String getTemaNombre(int indice) {
    Map<String,String> temaActual = temas[indice];
    return temaActual['nombre']!;
  }
}