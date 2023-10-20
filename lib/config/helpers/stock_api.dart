import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_aplication/Models/stock.dart';

class StockApi {
  final url = "http://proyectoapi.shop/Stock";

  Future<List<Stock>> get() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Stock> stoks = data.map((json) => Stock.fromJson(json)).toList();
      return stoks;
    }

    return [];
  }
}
