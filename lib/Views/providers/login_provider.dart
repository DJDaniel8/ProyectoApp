import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/trabajador.dart';
import 'package:proyecto_aplication/config/helpers/login_api.dart';

class LoginProvider extends ChangeNotifier {
  final loginApi = LoginApi();

  Future<bool> requestAccess(Trabajador trabajador) async {
    bool respuesta = await loginApi.requestAccess(trabajador);

    return respuesta;
  }
}
