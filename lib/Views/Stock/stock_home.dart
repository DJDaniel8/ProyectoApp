import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Views/Stock/tabla_stock.dart';

class StockHome extends StatelessWidget {
  const StockHome({super.key});

  @override
  Widget build(BuildContext context) {
    //final categoriaProvider = context.watch<CategoriaProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stocks"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: TablaStocks(
            sortAscending: true,
          ),
        ),
      ),
    );
  }
}
