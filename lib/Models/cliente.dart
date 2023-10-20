import 'dart:convert';

List<Cliente> clienteFromJson(String str) =>
    List<Cliente>.from(json.decode(str).map((x) => Cliente.fromJson(x)));

String clienteToJson(List<Cliente> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cliente {
  final int clienteId;
  final String nombre;
  final String? apellido;
  final String? genero;
  final String? nit;
  final String? direccion;
  final String? telefono;
  final String? email;

  Cliente({
    required this.clienteId,
    required this.nombre,
    required this.apellido,
    required this.genero,
    required this.nit,
    required this.direccion,
    required this.telefono,
    required this.email,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        clienteId: json["clienteId"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        genero: json["genero"],
        nit: json["nit"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "clienteId": clienteId,
        "nombre": nombre,
        "apellido": apellido,
        "genero": genero,
        "nit": nit,
        "direccion": direccion,
        "telefono": telefono,
        "email": email,
      };
}
