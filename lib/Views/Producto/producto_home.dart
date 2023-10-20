import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Views/Producto/tabla_producto.dart';

class ProductoHome extends StatelessWidget {
  const ProductoHome({super.key});

  @override
  Widget build(BuildContext context) {
    //final categoriaProvider = context.watch<CategoriaProvider>();
    return Scaffold(
      appBar: AppBar(
          title: const Text("Productos"),
          backgroundColor: Colors.blue,
          actions: [
            Builder(builder: (BuildContext context) {
              return IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, "/App/Productos/Crear");
                  });
            }),
          ]),
      body: const Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: TablaProductos(
            sortAscending: true,
          ),
        ),
      ),
    );
  }
}
