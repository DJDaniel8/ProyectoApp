import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/cliente.dart';
import 'package:proyecto_aplication/Views/providers/cliente_provider.dart';

class ClienteFormEditar extends StatelessWidget {
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
    nombreController.text = clienteProvider.selected!.nombre;
    apellidoController.text = clienteProvider.selected!.apellido!;
    generoController.text = clienteProvider.selected!.genero!;
    nitController.text = clienteProvider.selected!.nit!;
    direccionController.text = clienteProvider.selected!.direccion!;
    telefonoController.text = clienteProvider.selected!.telefono!;
    emailController.text = clienteProvider.selected!.email!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Crear Cliente'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el nombre del cliente';
                }
                return null;
              },
            ),
            TextFormField(
              controller: apellidoController,
              decoration: const InputDecoration(labelText: 'Apellido'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingrese el apellido del cliente';
                }
                return null;
              },
            ),
            TextFormField(
              controller: generoController,
              decoration: const InputDecoration(labelText: 'Género'),
            ),
            TextFormField(
              controller: nitController,
              decoration: const InputDecoration(labelText: 'NIT'),
            ),
            TextFormField(
              controller: direccionController,
              decoration: const InputDecoration(labelText: 'Dirección'),
            ),
            TextFormField(
              controller: telefonoController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            TextFormField(
              controller: emailController,
              decoration:
                  const InputDecoration(labelText: 'Correo Electrónico'),
              validator: (value) {
                if (value!.isNotEmpty && !value!.contains('@')) {
                  return 'Por favor, ingrese un correo electrónico válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
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
                //
                clienteProvider.update(clienteProvider.selected!, cliente);
                Navigator.pop(context);
              },
              child: const Text('Editar Cliente'),
            ),
          ],
        ),
      ),
    );
  }
}
