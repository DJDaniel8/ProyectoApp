import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/stock.dart';
import 'package:proyecto_aplication/Views/providers/stock_provider.dart';

class TablaStocks extends StatelessWidget {
  final bool sortAscending;

  const TablaStocks({super.key, required this.sortAscending});

  @override
  Widget build(BuildContext context) {
    final stockProvider = context.watch<StockProvider>();
    return DataTable(
      sortColumnIndex: 0,
      sortAscending: sortAscending,
      columns: const [
        DataColumn(label: Text("Producto")),
        DataColumn(label: Text("Stock")),
        DataColumn(label: Text("PC")),
        DataColumn(label: Text("PV")),
      ],
      rows: stockProvider.stocksList.map<DataRow>((Stock item) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(item.producto.nombre)),
            DataCell(Text("${item.existencia}")),
            DataCell(Text("Q${item.precioCompra}")),
            DataCell(Text("Q${item.precioVenta}")),
          ],
        );
      }).toList(),
    );
  }
}
