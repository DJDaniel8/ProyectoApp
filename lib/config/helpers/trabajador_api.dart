import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_aplication/Models/trabajador.dart';

class TrabajadorApi {
  final url = "http://proyectoapi.shop/Trabajador";

  Future<List<Trabajador>> get() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Trabajador> trabajadores =
          data.map((json) => Trabajador.fromJson(json)).toList();
      return trabajadores;
    }

    return [];
  }
}
