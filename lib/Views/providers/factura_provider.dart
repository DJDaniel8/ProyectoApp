import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/factura.dart';
import 'package:proyecto_aplication/Models/stock.dart';
import 'package:proyecto_aplication/config/helpers/factura_api.dart';

class FacturaProvider extends ChangeNotifier {
  final facturaApi = FacturaApi();

  List<Factura> facturasList = [];
  Factura? selected;
  List<Stock> productosFactura = [];

  FacturaProvider() {
    get();
  }

  Future<void> get() async {
    final facturas = await facturaApi.get();
    facturasList = facturas;
    notifyListeners();
  }

  Future<void> getProductosFactura(int ventaId) async {
    final stocks = await facturaApi.getProductosVenta(ventaId);
    productosFactura = stocks;
    notifyListeners();
  }
}
