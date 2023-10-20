import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_aplication/Models/factura.dart';
import 'package:proyecto_aplication/Models/stock.dart';

class VentaApi {
  final url = "http://proyectoapi.shop/Venta";

  Future<int> post(Factura factura) async {
    print(jsonEncode(factura.toJson()));
    final response = await http.post(Uri.parse("$url/Insert"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(factura.toJson()));

    if (response.statusCode == 200) {
      int res = int.parse(response.body);
      return res;
    }

    return 0;
  }

  Future<bool> postProductos(List<Stock> stocks) async {
    print("print en api");
    String json = jsonEncode(stocks.map((stock) => stock.toJson()).toList());
    print(json);
    final response = await http.post(Uri.parse("$url/InsertarProductos"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json);

    if (response.statusCode == 200) {
      print("print en api 2");
      return true;
    }

    return false;
  }
}
