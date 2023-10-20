import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/trabajador.dart';
import 'package:proyecto_aplication/Views/providers/trabajador_provider.dart';

class TablaTrabajadores extends StatelessWidget {
  final bool sortAscending;

  const TablaTrabajadores({super.key, required this.sortAscending});

  @override
  Widget build(BuildContext context) {
    final trabajadorProvider = context.watch<TrabajadorProvider>();
    return DataTable(
      sortColumnIndex: 0,
      sortAscending: sortAscending,
      columns: const [
        DataColumn(label: Text("Nombre")),
        DataColumn(label: Text("Telefono")),
      ],
      rows: trabajadorProvider.trabajadorList.map<DataRow>((Trabajador item) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(item.nombre)),
            DataCell(Text("${item.telefono}")),
          ],
        );
      }).toList(),
    );
  }
}
