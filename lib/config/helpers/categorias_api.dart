import 'dart:convert';
import 'package:proyecto_aplication/Models/categoria.dart';
import 'package:http/http.dart' as http;

class CategoriaApi {
  final url = "http://proyectoapi.shop/Categoria";

  Future<List<Categoria>> get() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Categoria> categorias =
          data.map((json) => Categoria.fromJson(json)).toList();
      return categorias;
    }

    return [];
  }

  Future<bool> delete(int categoriaId) async {
    final response = await http.delete(Uri.parse(url + "/$categoriaId"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> update(int categoriaId, Categoria categoria) async {
    final response = await http.put(Uri.parse(url + "/$categoriaId"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(categoria.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> post(Categoria categoria) async {
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(categoria.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
