import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Views/Venta/venta_venta.dart';

class VentaHome extends StatelessWidget {
  const VentaHome({super.key});

  @override
  Widget build(BuildContext context) {
    //final categoriaProvider = context.watch<CategoriaProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venta"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: VentaScreen(),
        ),
      ),
    );
  }
}
