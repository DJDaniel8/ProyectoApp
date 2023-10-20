import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aplication/Views/Categoria/homeView.dart';
import 'package:proyecto_aplication/Views/Cliente/cliente_home.dart';
import 'package:proyecto_aplication/Views/Cliente/crear_cliente.dart';
import 'package:proyecto_aplication/Views/Cliente/editar_cliente.dart';
import 'package:proyecto_aplication/Views/Factura/detalle_factura.dart';
import 'package:proyecto_aplication/Views/Factura/factura_home.dart';
import 'package:proyecto_aplication/Views/Login/login_screen.dart';
import 'package:proyecto_aplication/Views/Producto/crear_producto.dart';
import 'package:proyecto_aplication/Views/Producto/editar_producto.dart';
import 'package:proyecto_aplication/Views/Producto/producto_home.dart';
import 'package:proyecto_aplication/Views/Proveedor/crear_proveedor.dart';
import 'package:proyecto_aplication/Views/Proveedor/editar_proveedor.dart';
import 'package:proyecto_aplication/Views/Proveedor/proveedor_home.dart';
import 'package:proyecto_aplication/Views/Stock/stock_home.dart';
import 'package:proyecto_aplication/Views/Trabajador/trabajador_home.dart';
import 'package:proyecto_aplication/Views/Venta/agregar_producto.dart';
import 'package:proyecto_aplication/Views/Venta/venta_home.dart';
import 'package:proyecto_aplication/Views/providers/categoria_provider.dart';
import 'package:proyecto_aplication/Views/providers/cliente_provider.dart';
import 'package:proyecto_aplication/Views/providers/factura_provider.dart';
import 'package:proyecto_aplication/Views/providers/login_provider.dart';
import 'package:proyecto_aplication/Views/providers/producto_provider.dart';
import 'package:proyecto_aplication/Views/providers/proveedor_provider.dart';
import 'package:proyecto_aplication/Views/providers/stock_provider.dart';
import 'package:proyecto_aplication/Views/providers/trabajador_provider.dart';
import 'package:proyecto_aplication/Views/providers/venta_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => CategoriaProvider()),
        ChangeNotifierProvider(create: (_) => ClienteProvider()),
        ChangeNotifierProvider(create: (_) => ProveedorProvider()),
        ChangeNotifierProvider(create: (_) => ProductoProvider()),
        ChangeNotifierProvider(create: (_) => StockProvider()),
        ChangeNotifierProvider(create: (_) => TrabajadorProvider()),
        ChangeNotifierProvider(create: (_) => FacturaProvider()),
        ChangeNotifierProvider(create: (_) => VentaProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: ('inter'),
          useMaterial3: true,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => LoginScreen(),
          "/App": (context) => const AplicationContent(),
          "/App/Categorias": (context) => HomeView(),
          "/App/Clientes": (context) => const ClienteHome(),
          "/App/Clientes/Crear": (context) => ClienteForm(),
          "/App/Clientes/Editar": (context) => ClienteFormEditar(),
          "/App/Proveedores": (context) => const ProveedorHome(),
          "/App/Proveedores/Crear": (context) => ProveedorForm(),
          "/App/Proveedores/Editar": (context) => ProveedorFormEditar(),
          "/App/Productos": (context) => const ProductoHome(),
          "/App/Productos/Crear": (context) => ProductoForm(),
          "/App/Productos/Editar": (context) => ProductoFormEditar(),
          "/App/Stocks": (context) => const StockHome(),
          "/App/Personal": (context) => const TrabajadorHome(),
          "/App/Facturas": (context) => const FacturaHome(),
          "/App/Facturas/Detalle": (context) => const DetalleFactura(),
          "/App/Venta": (context) => const VentaHome(),
          "/App/Venta/Agregar": (context) => const AgregarProducto(),
        },
      ),
    );
  }
}
