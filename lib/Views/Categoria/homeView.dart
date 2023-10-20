import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Models/categoria.dart';
import 'package:proyecto_aplication/Views/Categoria/tableCategorias.dart';
import 'package:proyecto_aplication/Views/providers/categoria_provider.dart';
import 'package:proyecto_aplication/Views/Cliente/cliente_home.dart';

class AplicationContent extends StatelessWidget {
  const AplicationContent({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/App/Categorias",
      routes: {
        "/App/Categorias": (context) => HomeView(),
        "/App/Clientes": (context) => const ClienteHome(),
      },
      debugShowCheckedModeBanner: false,
      title: "Electronica EJDLM",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Electronica EJDLM"),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        body: Center(child: Image.asset('assets/OIG.jpeg')),
        drawer: Drawer(
          // Contenido del cajón de navegación (drawer)
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Categorias'),
                onTap: () {
                  Navigator.pushNamed(context, "/App/Categorias");
                },
              ),
              ListTile(
                title: const Text('Clientes'),
                onTap: () {
                  Navigator.pushNamed(context, "/App/Clientes");
                },
              ),
              ListTile(
                title: const Text('Proveedores'),
                onTap: () {
                  Navigator.pushNamed(context, "/App/Proveedores");
                },
              ),
              ListTile(
                title: const Text('Productos'),
                onTap: () {
                  Navigator.pushNamed(context, "/App/Productos");
                },
              ),
              ListTile(
                title: const Text('Stocks'),
                onTap: () {
                  Navigator.pushNamed(context, "/App/Stocks");
                },
              ),
              ListTile(
                title: const Text('Personal'),
                onTap: () {
                  Navigator.pushNamed(context, "/App/Personal");
                },
              ),
              ListTile(
                title: const Text('Facturas'),
                onTap: () {
                  Navigator.pushNamed(context, "/App/Facturas");
                },
              ),
              ListTile(
                title: const Text('Venta'),
                onTap: () {
                  Navigator.pushNamed(context, "/App/Venta");
                },
              ),
              // Agregar más opciones según sea necesario
            ],
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriaProvider = context.watch<CategoriaProvider>();
    return Scaffold(
      appBar: AppBar(
          title: const Text("Categorias Inicio"),
          backgroundColor: Colors.blue,
          actions: [
            Builder(builder: (BuildContext context) {
              return IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _mostrarAlertaNueva(context, categoriaProvider);
                  });
            }),
          ]),
      body: const Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: TableCategorias(
            sortAscending: true,
          ),
        ),
      ),
    );
  }

  void _mostrarAlertaNueva(BuildContext context, CategoriaProvider provider) {
    final TextEditingController textController =
        TextEditingController(text: "");
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Nueva"),
            content: TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: "Nombre:"),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    bool respuesta = await provider.postCategoria(
                        Categoria(categoriaId: 0, nombre: textController.text));
                    Navigator.pop(context);
                  },
                  child: const Text("Enviar")),
              TextButton(onPressed: () {}, child: const Text("Cancelar")),
            ],
          );
        });
  }
}
