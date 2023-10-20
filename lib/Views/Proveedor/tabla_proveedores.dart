import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/proveedor.dart';
import 'package:proyecto_aplication/Views/providers/proveedor_provider.dart';

class TablaProveedores extends StatelessWidget {
  final bool sortAscending;

  const TablaProveedores({super.key, required this.sortAscending});

  @override
  Widget build(BuildContext context) {
    final proveedorProvider = context.watch<ProveedorProvider>();
    return DataTable(
      sortColumnIndex: 0,
      sortAscending: sortAscending,
      columns: const [
        DataColumn(label: Text("Nombre")),
        DataColumn(label: Text("Telefono")),
        DataColumn(label: Text("Acciones")),
      ],
      rows: proveedorProvider.proveedoresList.map<DataRow>((Proveedor item) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(item.razonSocial)),
            DataCell(Text(item.telefono)),
            DataCell(
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      print("${item.proveedorId} ${item.razonSocial}");
                      proveedorProvider.selected = item;
                      Navigator.pushNamed(context, "/App/Proveedores/Editar");
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _mostrarAlertaEliminar(context, item, proveedorProvider);
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
    BuildContext context, Proveedor cliente, ProveedorProvider provider) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Eliminar"),
          content: Text("Desea Eliminar el Proveedor?"),
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
