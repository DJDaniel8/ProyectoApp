import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/Stock_venta.dart';
import 'package:proyecto_aplication/Models/stock.dart';
import 'package:proyecto_aplication/Views/providers/stock_provider.dart';
import 'package:proyecto_aplication/Views/providers/venta_provider.dart';

class AgregarProducto extends StatelessWidget {
  const AgregarProducto({super.key});

  @override
  Widget build(BuildContext context) {
    final stockProvider = context.watch<StockProvider>();
    final ventaProvider = context.watch<VentaProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Agregar Producto"),
      ),
      body: DataTable(
        sortColumnIndex: 0,
        sortAscending: true,
        columns: const [
          DataColumn(label: Text("Producto")),
          DataColumn(label: Text("Stock")),
          DataColumn(label: Text("PV")),
          DataColumn(label: Text("Env")),
        ],
        rows: stockProvider.stocksList.map<DataRow>((Stock item) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(item.producto.nombre)),
              DataCell(Text("${item.existencia}")),
              DataCell(Text("Q${item.precioVenta}")),
              DataCell(
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    ventaProvider.AgregarProducto(
                        StockVenta(stock: item, provider: ventaProvider));
                    Navigator.pop(context);
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
