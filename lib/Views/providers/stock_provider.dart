import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Models/stock.dart';
import 'package:proyecto_aplication/config/helpers/stock_api.dart';

class StockProvider extends ChangeNotifier {
  final stockApi = StockApi();

  List<Stock> stocksList = [];
  Stock? selected;

  StockProvider() {
    get();
  }

  Future<void> get() async {
    final stocks = await stockApi.get();
    stocksList = stocks;
    notifyListeners();
  }
}
