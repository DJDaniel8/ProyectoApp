import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/categoria.dart';
import 'package:proyecto_aplication/config/helpers/categorias_api.dart';

class CategoriaProvider extends ChangeNotifier {
  final categoriaApi = CategoriaApi();

  List<Categoria> categoriaList = [];

  CategoriaProvider() {
    getCategoria();
  }

  Future<void> getCategoria() async {
    final categorias = await categoriaApi.get();
    categoriaList = categorias;
    notifyListeners();
  }

  Future<bool> deleteCategoria(Categoria categoria) async {
    bool respuesta = await categoriaApi.delete(categoria.categoriaId);

    if (respuesta) {
      categoriaList.remove(categoria);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> updateCategoria(
      Categoria original, Categoria updateCategoria) async {
    bool respuesta =
        await categoriaApi.update(original.categoriaId, updateCategoria);

    if (respuesta) {
      categoriaList
          .where((element) => element.categoriaId == original.categoriaId)
          .first
          .nombre = updateCategoria.nombre;

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> postCategoria(Categoria categoria) async {
    bool respuesta = await categoriaApi.post(categoria);

    if (respuesta) {
      getCategoria();
      return true;
    } else {
      return false;
    }
  }
}
