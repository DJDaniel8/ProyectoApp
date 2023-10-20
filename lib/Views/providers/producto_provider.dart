import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/producto.dart';
import 'package:proyecto_aplication/config/helpers/producto_api.dart';

class ProductoProvider extends ChangeNotifier {
  final productoApi = ProductoApi();

  List<Producto> productosList = [];
  Producto? selected;

  ProductoProvider() {
    get();
  }

  Future<void> get() async {
    final productos = await productoApi.get();
    productosList = productos;
    notifyListeners();
  }

  Future<bool> delete(Producto producto) async {
    bool respuesta = await productoApi.delete(producto.productoId);

    if (respuesta) {
      productosList.remove(producto);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> update(Producto original, Producto update) async {
    bool respuesta = await productoApi.update(original.productoId, update);

    if (respuesta) {
      get();

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> post(Producto producto) async {
    bool respuesta = await productoApi.post(producto);

    if (respuesta) {
      get();
      return true;
    } else {
      return false;
    }
  }
}
