import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/factura.dart';
import 'package:proyecto_aplication/Views/providers/factura_provider.dart';

class TablaFacturas extends StatelessWidget {
  final bool sortAscending;

  const TablaFacturas({super.key, required this.sortAscending});

  @override
  Widget build(BuildContext context) {
    final facturaProvider = context.watch<FacturaProvider>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: 0,
        sortAscending: sortAscending,
        columns: const [
          DataColumn(label: Text("Nombre")),
          DataColumn(label: Text("Fecha")),
          DataColumn(label: Text("Total")),
          DataColumn(label: Text("Ver")),
        ],
        rows: facturaProvider.facturasList.map<DataRow>((Factura item) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(item.nombre)),
              DataCell(Text(
                  "${item.fecha.day}/${item.fecha.month}/${item.fecha.year}")),
              DataCell(Text("Q${item.total}")),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        facturaProvider.selected = item;
                        facturaProvider.getProductosFactura(item.id);
                        Navigator.pushNamed(context, "/App/Facturas/Detalle");
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
