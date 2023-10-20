import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/cliente.dart';
import 'package:proyecto_aplication/config/helpers/clientes_api.dart';

class ClienteProvider extends ChangeNotifier {
  final clienteApi = ClienteApi();

  List<Cliente> clientesList = [];
  Cliente? selected;

  ClienteProvider() {
    get();
  }

  Future<void> get() async {
    final clientes = await clienteApi.get();
    clientesList = clientes;
    notifyListeners();
  }

  Future<bool> delete(Cliente cliente) async {
    bool respuesta = await clienteApi.delete(cliente.clienteId);

    if (respuesta) {
      clientesList.remove(cliente);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> update(Cliente original, Cliente update) async {
    bool respuesta = await clienteApi.update(original.clienteId, update);

    if (respuesta) {
      get();

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> post(Cliente cliente) async {
    bool respuesta = await clienteApi.post(cliente);

    if (respuesta) {
      get();
      return true;
    } else {
      return false;
    }
  }
}
