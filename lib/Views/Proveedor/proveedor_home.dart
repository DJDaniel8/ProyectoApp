import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Views/Proveedor/tabla_proveedores.dart';

class ProveedorHome extends StatelessWidget {
  const ProveedorHome({super.key});

  @override
  Widget build(BuildContext context) {
    //final categoriaProvider = context.watch<CategoriaProvider>();
    return Scaffold(
      appBar: AppBar(
          title: const Text("Proveedores"),
          backgroundColor: Colors.blue,
          actions: [
            Builder(builder: (BuildContext context) {
              return IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, "/App/Proveedores/Crear");
                  });
            }),
          ]),
      body: const Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: TablaProveedores(
            sortAscending: true,
          ),
        ),
      ),
    );
  }
}
