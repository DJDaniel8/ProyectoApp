import 'dart:convert';

import 'package:proyecto_aplication/Models/cliente.dart';
import 'package:proyecto_aplication/Models/trabajador.dart';

List<Factura> facturaFromJson(String str) =>
    List<Factura>.from(json.decode(str).map((x) => Factura.fromJson(x)));

String facturaToJson(List<Factura> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Factura {
  final int id;
  final Cliente cliente;
  final Trabajador trabajador;
  final DateTime fecha;
  final bool esAuditorada;
  final String nombre;
  final String nombreTrabajador;
  final double total;

  Factura({
    required this.id,
    required this.cliente,
    required this.trabajador,
    required this.fecha,
    required this.esAuditorada,
    required this.nombre,
    required this.nombreTrabajador,
    required this.total,
  });

  factory Factura.fromJson(Map<String, dynamic> json) => Factura(
        id: json["id"],
        cliente: Cliente.fromJson(json["cliente"]),
        trabajador: Trabajador.fromJson(json["trabajador"]),
        fecha: DateTime.parse(json["fecha"]),
        esAuditorada: json["esAuditorada"],
        nombre: json["nombre"],
        nombreTrabajador: json["nombreTrabajador"],
        total: json["total"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cliente": cliente.toJson(),
        "trabajador": trabajador.toJson(),
        "fecha": fecha.toIso8601String(),
        "esAuditorada": esAuditorada,
        "nombre": nombre,
        "nombreTrabajador": nombreTrabajador,
        "total": total,
      };
}
