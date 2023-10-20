import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_aplication/Models/cliente.dart';

class ClienteApi {
  final url = "http://proyectoapi.shop/Cliente";

  Future<List<Cliente>> get() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Cliente> clientes =
          data.map((json) => Cliente.fromJson(json)).toList();
      return clientes;
    }

    return [];
  }

  Future<bool> delete(int clienteId) async {
    final response = await http.delete(Uri.parse(url + "/$clienteId"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> update(int clienteId, Cliente cliente) async {
    final response = await http.put(Uri.parse(url + "/$clienteId"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(cliente.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> post(Cliente cliente) async {
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(cliente.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
