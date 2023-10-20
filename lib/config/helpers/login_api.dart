import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_aplication/Models/trabajador.dart';

class LoginApi {
  final url = "http://proyectoapi.shop/Trabajador";

  Future<bool> requestAccess(Trabajador trabajador) async {
    final response = await http.post(Uri.parse("$url/RequestAccess"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(trabajador.toJson()));

    bool res = false;
    if (response.statusCode == 200) {
      res = bool.parse(response.body);
    }

    return res;
  }
}
