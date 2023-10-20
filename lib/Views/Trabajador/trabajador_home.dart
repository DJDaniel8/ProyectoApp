import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Views/Trabajador/tabla_trabajador.dart';

class TrabajadorHome extends StatelessWidget {
  const TrabajadorHome({super.key});

  @override
  Widget build(BuildContext context) {
    //final categoriaProvider = context.watch<CategoriaProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: TablaTrabajadores(
            sortAscending: true,
          ),
        ),
      ),
    );
  }
}
