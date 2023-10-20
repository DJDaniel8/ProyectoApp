import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/stock.dart';
import 'package:proyecto_aplication/Views/providers/factura_provider.dart';

class DetalleFactura extends StatelessWidget {
  const DetalleFactura({super.key});

  @override
  Widget build(BuildContext context) {
    final facturaProvider = context.watch<FacturaProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Detalle Factura"),
      ),
      body: DataTable(
        sortColumnIndex: 0,
        sortAscending: true,
        columns: const [
          DataColumn(label: Text("#")),
          DataColumn(label: Text("Nombre")),
          DataColumn(label: Text("PreU")),
          DataColumn(label: Text("Total")),
        ],
        rows: facturaProvider.productosFactura.map<DataRow>((Stock item) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text("${item.existencia}")),
              DataCell(Text(item.producto.nombre)),
              DataCell(Text("Q${item.precioVenta}")),
              DataCell(Text("Q${item.existencia * item.precioVenta}")),
            ],
          );
        }).toList(),
      ),
    );
  }
}
