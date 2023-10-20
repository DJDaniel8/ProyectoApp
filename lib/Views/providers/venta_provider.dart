import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/Stock_venta.dart';
import 'package:proyecto_aplication/Models/factura.dart';
import 'package:proyecto_aplication/Models/stock.dart';
import 'package:proyecto_aplication/config/helpers/venta_api.dart';

class VentaProvider extends ChangeNotifier {
  final ventaApi = VentaApi();

  List<StockVenta> stocksList = [];

  // ignore: non_constant_identifier_names
  void AgregarProducto(StockVenta stock) {
    stocksList.add(stock);
    notifyListeners();
  }

  void notificarCambio() {
    notifyListeners();
  }

  Future<int> post(Factura factura) async {
    int respuesta = await ventaApi.post(factura);

    if (respuesta > 0) {
      return respuesta;
    } else {
      return 0;
    }
  }

  Future<bool> postProductos(List<Stock> stocks) async {
    print("print 1 en post en provider");
    bool respuesta = await ventaApi.postProductos(stocks);
    print("print 2 en post en provider");

    return respuesta;
  }
}
