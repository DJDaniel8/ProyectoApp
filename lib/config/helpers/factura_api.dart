import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_aplication/Models/factura.dart';
import 'package:proyecto_aplication/Models/stock.dart';

class FacturaApi {
  final url = "http://proyectoapi.shop/Venta";

  Future<List<Factura>> get() async {
    final response = await http.get(Uri.parse("$url/get"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Factura> facturas =
          data.map((json) => Factura.fromJson(json)).toList();
      return facturas;
    }

    return [];
  }

  Future<List<Stock>> getProductosVenta(int ventaId) async {
    final respone =
        await http.get(Uri.parse("$url/getProductosVentas/$ventaId"));

    if (respone.statusCode == 200) {
      List<dynamic> data = json.decode(respone.body);
      List<Stock> stocks = data.map((json) => Stock.fromJson(json)).toList();
      return stocks;
    }
    return [];
  }
}
