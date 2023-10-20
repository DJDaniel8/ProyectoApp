import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/producto.dart';
import 'package:proyecto_aplication/Models/proveedor.dart';
import 'package:proyecto_aplication/Views/providers/producto_provider.dart';
import 'package:proyecto_aplication/Views/providers/proveedor_provider.dart';

class ProductoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController codigoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  Proveedor? selectedProveedor;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Prodcuto creado:');
      print('Codigo: ${codigoController.text}');
      print('nombre: ${nombreController.text}');
      print('Descripcion: ${descripcionController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final productoProvider = context.watch<ProductoProvider>();
    final proveedorProvider = context.watch<ProveedorProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Crear Producto'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: codigoController,
              decoration: const InputDecoration(labelText: 'Codigo'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el codigo del cliente';
                }
                return null;
              },
            ),
            TextFormField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el apellido del cliente';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripcion'),
            ),
            DropdownButtonFormField<Proveedor>(
              value: selectedProveedor, // Valor inicial
              items:
                  proveedorProvider.proveedoresList.map((Proveedor proveedor) {
                return DropdownMenuItem<Proveedor>(
                  value: proveedor,
                  child: Text(proveedor
                      .razonSocial), // Puedes mostrar el nombre del proveedor aquí
                );
              }).toList(),
              onChanged: (value) {
                selectedProveedor =
                    value; // Actualizar el ID del proveedor seleccionado
              },
              decoration: const InputDecoration(labelText: 'Proveedor'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _submitForm();
                Producto producto = Producto(
                  productoId: 0,
                  codigo: codigoController.text,
                  nombre: nombreController.text,
                  descripcion: descripcionController.text,
                  proveedorId: selectedProveedor!.proveedorId,
                );
                productoProvider.post(producto);

                Navigator.pop(context);
              },
              child: const Text('Crear Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
