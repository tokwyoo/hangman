import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';

List<String> imagenes = [
  './../assets/base/background.png',
  './../assets/futurista/background.png',
  './../assets/lobito/background.png',
  './../assets/hello_kitty/background.png',
  './../assets/kirby/background.png'];

class ConfiguracionPage extends StatefulWidget {
  ConfiguracionPage({super.key});
  final SettingsController settingsController = Get.find(); // Retrieve the controller
  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  // Initialize _temaSeleccionado with a default value
  late TemaJuego? _temaSeleccionado; // Use late to initialize in initState

  @override
  void initState() {
    super.initState();
    _temaSeleccionado = TemaJuego.values[widget.settingsController.getTema()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('Seleccione el tema deseado', style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [DropdownButton<TemaJuego>(
                value: _temaSeleccionado,
                onChanged: (TemaJuego? nuevoValor) {
                  setState(() {
                    _temaSeleccionado = nuevoValor;
                  });
                },
                items:  <DropdownMenuItem<TemaJuego>>[
                  DropdownMenuItem<TemaJuego>(
                    value: TemaJuego.base,
                    child: Text('Base'),
                  ),
                  DropdownMenuItem<TemaJuego>(
                    value: TemaJuego.futurista,
                    child: Text('Futurista'),
                  ),
                  DropdownMenuItem<TemaJuego>(
                    value: TemaJuego.lobito,
                    child: Text('Lobito'),
                  ),
                  DropdownMenuItem<TemaJuego>(
                    value: TemaJuego.hello_kitty,
                    child: Text('Hello Kitty'),
                  ),
                  DropdownMenuItem<TemaJuego>(
                    value: TemaJuego.kirby,
                    child: Text('Kirby'),
                  ),
                ],
              ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Image.asset(imagenes[_temaSeleccionado!.index],
                  //height: 100,),
                  widget.settingsController.showTemaBackground(_temaSeleccionado!.index,100),
                ]
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality to save preference
                    widget.settingsController.actualizaTema( _temaSeleccionado!.index);

                  },
                  child: Text('Guardar preferencia'),
                )
              ],)
          ],
        ),
      ),
    );
  }
}