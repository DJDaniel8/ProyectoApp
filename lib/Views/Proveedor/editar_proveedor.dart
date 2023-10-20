import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/proveedor.dart';
import 'package:proyecto_aplication/Views/providers/proveedor_provider.dart';

class ProveedorFormEditar extends StatelessWidget {
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
    razonSocialController.text = proveedorProvider.selected!.razonSocial;
    direccionController.text = proveedorProvider.selected!.direccion;
    telefonoController.text = proveedorProvider.selected!.telefono;

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
              decoration: const InputDecoration(labelText: 'Direccion'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el apellido del cliente';
                }
                return null;
              },
            ),
            TextFormField(
              controller: telefonoController,
              decoration: const InputDecoration(labelText: 'Telefono'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _submitForm();
                Proveedor proveedor = Proveedor(
                    proveedorId: proveedorProvider.selected!.proveedorId,
                    razonSocial: razonSocialController.text,
                    direccion: direccionController.text,
                    telefono: telefonoController.text);
                //
                proveedorProvider.update(
                    proveedorProvider.selected!, proveedor);
                Navigator.pop(context);
              },
              child: const Text('Editar Proveedor'),
            ),
          ],
        ),
      ),
    );
  }
}
