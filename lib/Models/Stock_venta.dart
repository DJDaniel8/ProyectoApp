// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/stock.dart';
import 'package:proyecto_aplication/Views/providers/venta_provider.dart';

class StockVenta {
  Stock stock;
  final TextEditingController controller = TextEditingController();
  late double total;
  late int cantidad = 0;
  VentaProvider provider;

  StockVenta({required this.stock, required this.provider}) {
    controller.text = "1";
    cantidad = 1;
    total = stock.precioVenta * cantidad;
    controller.addListener(() {
      cantidad = int.tryParse(controller.text) == null
          ? 0
          : int.parse(controller.text);
      calcularTotal();
      provider.notificarCambio();
    });
  }

  calcularTotal() {
    total = stock.precioVenta * cantidad;
  }
}
