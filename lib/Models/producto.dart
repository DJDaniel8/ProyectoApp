import 'dart:convert';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  final int productoId;
  final String codigo;
  final String nombre;
  final String descripcion;
  final int proveedorId;

  Producto({
    required this.productoId,
    required this.codigo,
    required this.nombre,
    required this.descripcion,
    required this.proveedorId,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        productoId: json["productoId"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        descripcion: json["descripcion"] == null ? "" : json["descripcion"],
        proveedorId: json["proveedorId"],
      );

  Map<String, dynamic> toJson() => {
        "productoId": productoId,
        "codigo": codigo,
        "nombre": nombre,
        "descripcion": descripcion,
        "proveedorId": proveedorId,
      };
}
