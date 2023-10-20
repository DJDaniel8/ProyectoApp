import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/producto.dart';
import 'package:proyecto_aplication/Views/providers/producto_provider.dart';

class ProductoFormEditar extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController codigoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Cliente creado:');
      print('Nombre: ${codigoController.text}');
      print('Apellido: ${nombreController.text}');
      print('Género: ${descripcionController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final productoProvider = context.watch<ProductoProvider>();
    codigoController.text = productoProvider.selected!.codigo;
    nombreController.text = productoProvider.selected!.nombre;
    descripcionController.text = productoProvider.selected!.descripcion;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Editar Proveedor'),
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
                  return 'Por favor, ingrese el nombre del producto';
                }
                return null;
              },
            ),
            TextFormField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el apellido del producto';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripcion'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _submitForm();
                Producto producto = Producto(
                  productoId: productoProvider.selected!.productoId,
                  codigo: codigoController.text,
                  nombre: nombreController.text,
                  descripcion: descripcionController.text,
                  proveedorId: 0,
                );
                //
                productoProvider.update(productoProvider.selected!, producto);
                Navigator.pop(context);
              },
              child: const Text('Editar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
