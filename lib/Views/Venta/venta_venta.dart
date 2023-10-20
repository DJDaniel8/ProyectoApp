import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/Stock_venta.dart';
import 'package:proyecto_aplication/Models/cliente.dart';
import 'package:proyecto_aplication/Models/factura.dart';
import 'package:proyecto_aplication/Models/stock.dart';
import 'package:proyecto_aplication/Models/trabajador.dart';
import 'package:proyecto_aplication/Views/providers/venta_provider.dart';

class VentaScreen extends StatelessWidget {
  const VentaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController nitController = TextEditingController();
    final ventaProvider = context.watch<VentaProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/App/Venta/Agregar");
                  },
                  child: const Text('Agregar Producto'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    List<Stock> list = [];
                    ventaProvider.stocksList.forEach((element) {
                      element.stock.existencia = element.cantidad;
                      list.add(element.stock);
                    });
                    print(list);
                    Cliente cliente = Cliente(
                        clienteId: 0,
                        nombre: nombreController.text,
                        apellido: "",
                        genero: "",
                        nit: nitController.text,
                        direccion: "",
                        telefono: "",
                        email: "");
                    print(cliente);
                    Trabajador trabajador = Trabajador(
                        trabajadorId: 1,
                        nombre: "Daniel",
                        apellido: "Fuentes",
                        sexo: "Masculino",
                        puesto: "Gerente",
                        usuario: "Daniel3955",
                        contrasea: "",
                        direccion: "",
                        telefono: "",
                        email: "",
                        sueldo: 10000,
                        rol: 0);
                    print(trabajador);
                    Factura venta = Factura(
                        id: 0,
                        cliente: cliente,
                        trabajador: trabajador,
                        fecha: DateTime.now(),
                        esAuditorada: false,
                        nombre: nombreController.text,
                        nombreTrabajador:
                            "${trabajador.nombre} ${trabajador.apellido}",
                        total: 0);
                    int id = await ventaProvider.post(venta);
                    print("el id de la venta es ${id}");
                    bool res = await ventaProvider.postProductos(list);
                    print("pase el await");
                    if (res) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Finalizar Venta'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre del Cliente'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: nitController,
              decoration: InputDecoration(labelText: 'NIT del Cliente'),
            ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
              child: DataTable(
                  columns: const [
                    DataColumn(label: Text('#')),
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('PreU')),
                    DataColumn(label: Text('Total')),
                  ],
                  rows:
                      ventaProvider.stocksList.map<DataRow>((StockVenta item) {
                    return DataRow(cells: [
                      DataCell(
                        TextFormField(
                          controller: item.controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              int? num = int.tryParse(value);
                              if (num != null) return null;
                              return 'Por favor, ingrese el nombre del cliente';
                            }
                            return null;
                          },
                        ),
                      ),
                      DataCell(Text(item.stock.producto.nombre)),
                      DataCell(Text("${item.stock.precioVenta}")),
                      DataCell(Text("Q${item.total}")),
                    ]);
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
