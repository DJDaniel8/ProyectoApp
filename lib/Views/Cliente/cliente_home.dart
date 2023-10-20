import 'package:flutter/material.dart';
import 'package:proyecto_aplication/Views/Cliente/tabla_clientes.dart';

class ClienteHome extends StatelessWidget {
  const ClienteHome({super.key});

  @override
  Widget build(BuildContext context) {
    //final categoriaProvider = context.watch<CategoriaProvider>();
    return Scaffold(
      appBar: AppBar(
          title: const Text("Clientes"),
          backgroundColor: Colors.blue,
          actions: [
            Builder(builder: (BuildContext context) {
              return IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, "/App/Clientes/Crear");
                  });
            }),
          ]),
      body: const Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: TablaClientes(
            sortAscending: true,
          ),
        ),
      ),
    );
  }
}
