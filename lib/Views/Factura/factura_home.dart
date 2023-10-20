import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Views/Factura/tabla_facturas.dart';

class FacturaHome extends StatelessWidget {
  const FacturaHome({super.key});

  @override
  Widget build(BuildContext context) {
    //final categoriaProvider = context.watch<CategoriaProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facturas"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: TablaFacturas(
            sortAscending: true,
          ),
        ),
      ),
    );
  }
}
