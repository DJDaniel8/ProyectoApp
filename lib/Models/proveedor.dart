import 'dart:convert';

List<Proveedor> proveedorFromJson(String str) =>
    List<Proveedor>.from(json.decode(str).map((x) => Proveedor.fromJson(x)));

String proveedorToJson(List<Proveedor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Proveedor {
  final int proveedorId;
  final String razonSocial;
  final String direccion;
  final String telefono;

  Proveedor({
    required this.proveedorId,
    required this.razonSocial,
    required this.direccion,
    required this.telefono,
  });

  factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
        proveedorId: json["proveedorId"],
        razonSocial: json["razonSocial"],
        direccion: json["direccion"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "proveedorId": proveedorId,
        "razonSocial": razonSocial,
        "direccion": direccion,
        "telefono": telefono,
      };
}
