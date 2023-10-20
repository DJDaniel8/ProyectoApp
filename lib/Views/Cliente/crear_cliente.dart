import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/cliente.dart';
import 'package:proyecto_aplication/Views/providers/cliente_provider.dart';

class ClienteForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController generoController = TextEditingController();
  final TextEditingController nitController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Cliente creado:');
      print('Nombre: ${nombreController.text}');
      print('Apellido: ${apellidoController.text}');
      print('Género: ${generoController.text}');
      print('NIT: ${nitController.text}');
      print('Dirección: ${direccionController.text}');
      print('Teléfono: ${telefonoController.text}');
      print('Email: ${emailController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final clienteProvider = context.watch<ClienteProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Crear Cliente'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el nombre del cliente';
                }
                return null;
              },
            ),
            TextFormField(
              controller: apellidoController,
              decoration: InputDecoration(labelText: 'Apellido'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el apellido del cliente';
                }
                return null;
              },
            ),
            TextFormField(
              controller: generoController,
              decoration: InputDecoration(labelText: 'Género'),
            ),
            TextFormField(
              controller: nitController,
              decoration: InputDecoration(labelText: 'NIT'),
            ),
            TextFormField(
              controller: direccionController,
              decoration: InputDecoration(labelText: 'Dirección'),
            ),
            TextFormField(
              controller: telefonoController,
              decoration: InputDecoration(labelText: 'Teléfono'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              validator: (value) {
                if (value!.isNotEmpty && !value!.contains('@')) {
                  return 'Por favor, ingrese un correo electrónico válido';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _submitForm();
                Cliente cliente = Cliente(
                  clienteId: 0,
                  nombre: nombreController.text,
                  apellido: apellidoController.text,
                  genero: generoController.text,
                  nit: nitController.text,
                  direccion: direccionController.text,
                  telefono: telefonoController.text,
                  email: emailController.text,
                );
                clienteProvider.post(cliente);

                Navigator.pop(context);
              },
              child: Text('Crear Cliente'),
            ),
          ],
        ),
      ),
    );
  }
}
