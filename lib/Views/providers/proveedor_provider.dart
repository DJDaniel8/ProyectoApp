import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/proveedor.dart';
import 'package:proyecto_aplication/config/helpers/proveedor_api.dart';

class ProveedorProvider extends ChangeNotifier {
  final proveedorApi = ProveedorApi();

  List<Proveedor> proveedoresList = [];
  Proveedor? selected;

  ProveedorProvider() {
    get();
  }

  Future<void> get() async {
    final proveedores = await proveedorApi.get();
    proveedoresList = proveedores;
    notifyListeners();
  }

  Future<bool> delete(Proveedor proveedor) async {
    bool respuesta = await proveedorApi.delete(proveedor.proveedorId);

    if (respuesta) {
      proveedoresList.remove(proveedor);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> update(Proveedor original, Proveedor update) async {
    bool respuesta = await proveedorApi.update(original.proveedorId, update);

    if (respuesta) {
      get();

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> post(Proveedor proveedor) async {
    bool respuesta = await proveedorApi.post(proveedor);

    if (respuesta) {
      get();
      return true;
    } else {
      return false;
    }
  }
}
