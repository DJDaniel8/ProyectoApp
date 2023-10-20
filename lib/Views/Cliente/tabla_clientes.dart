import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/categoria.dart';
import 'package:proyecto_aplication/Models/cliente.dart';
import 'package:proyecto_aplication/Views/providers/categoria_provider.dart';
import 'package:proyecto_aplication/Views/providers/cliente_provider.dart';

class TablaClientes extends StatelessWidget {
  final bool sortAscending;

  const TablaClientes({super.key, required this.sortAscending});

  @override
  Widget build(BuildContext context) {
    final clienteProvider = context.watch<ClienteProvider>();
    return DataTable(
      sortColumnIndex: 0,
      sortAscending: sortAscending,
      columns: const [
        DataColumn(label: Text("Nombre")),
        DataColumn(label: Text("Nit")),
        DataColumn(label: Text("Acciones")),
      ],
      rows: clienteProvider.clientesList.map<DataRow>((Cliente item) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text("${item.nombre} ${item.apellido}")),
            DataCell(Text("${item.nit}")),
            DataCell(
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      print("${item.clienteId} ${item.nombre}");
                      clienteProvider.selected = item;
                      Navigator.pushNamed(context, "/App/Clientes/Editar");
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _mostrarAlertaEliminar(context, item, clienteProvider);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

void _mostrarAlertaEliminar(
    BuildContext context, Cliente cliente, ClienteProvider provider) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Eliminar"),
          content: Text("Desea Eliminar el Cliente?"),
          actions: [
            TextButton(
                onPressed: () async {
                  bool respuesta = await provider.delete(cliente);
                  Navigator.pop(context);
                },
                child: Text("Si Eliminar")),
            TextButton(onPressed: () {}, child: Text("Cancelar")),
          ],
        );
      });
}
