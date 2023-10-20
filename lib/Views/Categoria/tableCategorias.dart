import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/categoria.dart';
import 'package:proyecto_aplication/Views/providers/categoria_provider.dart';

class TableCategorias extends StatelessWidget {
  final bool sortAscending;

  const TableCategorias({super.key, required this.sortAscending});

  @override
  Widget build(BuildContext context) {
    final categoriaProvider = context.watch<CategoriaProvider>();
    return SingleChildScrollView(
      child: DataTable(
        sortColumnIndex: 0,
        sortAscending: sortAscending,
        columns: const [
          DataColumn(label: Text("Nombre")),
          DataColumn(label: Text("Editar")),
          DataColumn(label: Text("Eliminar")),
        ],
        rows: categoriaProvider.categoriaList
            .map<DataRow>((Categoria categoriaItem) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(categoriaItem.nombre)),
              DataCell(
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    print(
                        "${categoriaItem.categoriaId} ${categoriaItem.nombre}");
                    _mostrarAlertaEditar(
                        context, categoriaItem, categoriaProvider);
                  },
                ),
              ),
              DataCell(
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    print(
                        "${categoriaItem.categoriaId} ${categoriaItem.nombre}");
                    _mostrarAlertaEliminar(
                        context, categoriaItem, categoriaProvider);
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

void _mostrarAlertaEliminar(
    BuildContext context, Categoria categoria, CategoriaProvider provider) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Eliminar"),
          content: Text("Desea Eliminar La Categoria?"),
          actions: [
            TextButton(
                onPressed: () async {
                  bool respuesta = await provider.deleteCategoria(categoria);
                  Navigator.pop(context);
                },
                child: Text("Si Eliminar")),
            TextButton(onPressed: () {}, child: Text("Cancelar")),
          ],
        );
      });
}

void _mostrarAlertaEditar(
    BuildContext context, Categoria categoria, CategoriaProvider provider) {
  final TextEditingController textController =
      TextEditingController(text: categoria.nombre);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Actualizar?"),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(labelText: "Nombre:"),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  bool respuesta = await provider.updateCategoria(categoria,
                      Categoria(categoriaId: 0, nombre: textController.text));
                  Navigator.pop(context);
                },
                child: Text("Si Actualizar")),
            TextButton(onPressed: () {}, child: Text("Cancelar")),
          ],
        );
      });
}
