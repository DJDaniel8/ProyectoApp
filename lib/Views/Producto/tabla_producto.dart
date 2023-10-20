import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/producto.dart';
import 'package:proyecto_aplication/Views/providers/producto_provider.dart';

class TablaProductos extends StatelessWidget {
  final bool sortAscending;

  const TablaProductos({super.key, required this.sortAscending});

  @override
  Widget build(BuildContext context) {
    final productoProvider = context.watch<ProductoProvider>();
    return DataTable(
      sortColumnIndex: 0,
      sortAscending: sortAscending,
      columns: const [
        DataColumn(label: Text("Codigo")),
        DataColumn(label: Text("Nombre")),
        DataColumn(label: Text("Acciones")),
      ],
      rows: productoProvider.productosList.map<DataRow>((Producto item) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(item.codigo)),
            DataCell(Text(item.nombre)),
            DataCell(
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      print("${item.productoId} ${item.nombre}");
                      productoProvider.selected = item;
                      Navigator.pushNamed(context, "/App/Productos/Editar");
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _mostrarAlertaEliminar(context, item, productoProvider);
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
    BuildContext context, Producto producto, ProductoProvider provider) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Eliminar"),
          content: Text("Desea Eliminar el Producto?"),
          actions: [
            TextButton(
                onPressed: () async {
                  bool respuesta = await provider.delete(producto);
                  Navigator.pop(context);
                },
                child: Text("Si Eliminar")),
            TextButton(onPressed: () {}, child: Text("Cancelar")),
          ],
        );
      });
}
