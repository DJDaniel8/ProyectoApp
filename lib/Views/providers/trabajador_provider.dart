import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/trabajador.dart';
import 'package:proyecto_aplication/config/helpers/trabajador_api.dart';

class TrabajadorProvider extends ChangeNotifier {
  final trabajadorApi = TrabajadorApi();

  List<Trabajador> trabajadorList = [];
  Trabajador? selected;

  TrabajadorProvider() {
    get();
  }

  Future<void> get() async {
    final trabajadores = await trabajadorApi.get();
    trabajadorList = trabajadores;
    notifyListeners();
  }
}
