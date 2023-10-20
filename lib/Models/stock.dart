import 'dart:convert';

import 'package:proyecto_aplication/Models/producto.dart';

List<Stock> stockFromJson(String str) =>
    List<Stock>.from(json.decode(str).map((x) => Stock.fromJson(x)));

String stockToJson(List<Stock> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stock {
  final int stockId;
  final Producto producto;
  int existencia;
  final double precioCompra;
  final double precioVentaMinimo;
  final double precioVenta;

  Stock({
    required this.stockId,
    required this.producto,
    required this.existencia,
    required this.precioCompra,
    required this.precioVentaMinimo,
    required this.precioVenta,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        stockId: json["stockId"],
        producto: Producto.fromJson(json["producto"]),
        existencia: json["existencia"],
        precioCompra: json["precioCompra"]?.toDouble(),
        precioVentaMinimo: json["precioVentaMinimo"]?.toDouble(),
        precioVenta: json["precioVenta"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "stockId": stockId,
        "producto": producto.toJson(),
        "existencia": existencia,
        "precioCompra": precioCompra,
        "precioVentaMinimo": precioVentaMinimo,
        "precioVenta": precioVenta,
      };
}
