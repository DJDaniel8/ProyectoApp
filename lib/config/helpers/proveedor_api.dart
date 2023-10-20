import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_aplication/Models/proveedor.dart';

class ProveedorApi {
  final url = "http://proyectoapi.shop/Proveedor";

  Future<List<Proveedor>> get() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Proveedor> proveedores =
          data.map((json) => Proveedor.fromJson(json)).toList();
      return proveedores;
    }

    return [];
  }

  Future<bool> delete(int proveedorId) async {
    final response = await http.delete(Uri.parse(url + "/$proveedorId"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> update(int proveedorId, Proveedor proveedor) async {
    final response = await http.put(Uri.parse(url + "/$proveedorId"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(proveedor.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> post(Proveedor proveedor) async {
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(proveedor.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
