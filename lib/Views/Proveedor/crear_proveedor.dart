import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/proveedor.dart';
import 'package:proyecto_aplication/Views/providers/proveedor_provider.dart';

class ProveedorForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController razonSocialController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Cliente creado:');
      print('Nombre: ${razonSocialController.text}');
      print('Apellido: ${direccionController.text}');
      print('Género: ${telefonoController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final proveedorProvider = context.watch<ProveedorProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Crear Proveedor'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: razonSocialController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el nombre del cliente';
                }
                return null;
              },
            ),
            TextFormField(
              controller: direccionController,
              decoration: InputDecoration(labelText: 'Direccion'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el apellido del cliente';
                }
                return null;
              },
            ),
            TextFormField(
              controller: telefonoController,
              decoration: InputDecoration(labelText: 'Telefono'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _submitForm();
                Proveedor proveedor = Proveedor(
                  proveedorId: 0,
                  razonSocial: razonSocialController.text,
                  direccion: direccionController.text,
                  telefono: telefonoController.text,
                );
                proveedorProvider.post(proveedor);

                Navigator.pop(context);
              },
              child: Text('Crear Proveedor'),
            ),
          ],
        ),
      ),
    );
  }
}
