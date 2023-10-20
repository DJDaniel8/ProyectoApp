import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_aplication/Models/producto.dart';

class ProductoApi {
  final url = "http://proyectoapi.shop/Producto";

  Future<List<Producto>> get() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Producto> productos =
          data.map((json) => Producto.fromJson(json)).toList();
      return productos;
    }

    return [];
  }

  Future<bool> delete(int productoId) async {
    final response = await http.delete(Uri.parse(url + "/$productoId"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> update(int productoId, Producto producto) async {
    final response = await http.put(Uri.parse(url + "/$productoId"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(producto.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> post(Producto producto) async {
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(producto.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
