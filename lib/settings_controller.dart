import 'package:get/get.dart';

class SettingsController extends GetxController {
  var tema = 0;
  actualizaTema(int nuevoTema) {
    if (nuevoTema > 0 && nuevoTema < 2) {
      tema = nuevoTema;
      update();
    }
  }

  int getTema() {
    return tema;
  }
}
