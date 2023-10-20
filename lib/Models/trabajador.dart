import 'dart:convert';

List<Trabajador> trabajadorFromJson(String str) =>
    List<Trabajador>.from(json.decode(str).map((x) => Trabajador.fromJson(x)));

String trabajadorToJson(List<Trabajador> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trabajador {
  final int trabajadorId;
  final String nombre;
  final String apellido;
  final String sexo;
  final String puesto;
  final String usuario;
  final dynamic contrasea;
  final String? direccion;
  final String? telefono;
  final String? email;
  final double sueldo;
  final int rol;

  Trabajador({
    required this.trabajadorId,
    required this.nombre,
    required this.apellido,
    required this.sexo,
    required this.puesto,
    required this.usuario,
    required this.contrasea,
    required this.direccion,
    required this.telefono,
    required this.email,
    required this.sueldo,
    required this.rol,
  });

  factory Trabajador.fromJson(Map<String, dynamic> json) => Trabajador(
        trabajadorId: json["trabajadorId"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        sexo: json["sexo"],
        puesto: json["puesto"],
        usuario: json["usuario"],
        contrasea: json["contraseña"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        email: json["email"],
        sueldo: json["sueldo"] == 0 ? 0.00 : json["sueldo"],
        rol: json["rol"],
      );

  Map<String, dynamic> toJson() => {
        "trabajadorId": trabajadorId,
        "nombre": nombre,
        "apellido": apellido,
        "sexo": sexo,
        "puesto": puesto,
        "usuario": usuario,
        "contraseña": contrasea,
        "direccion": direccion,
        "telefono": telefono,
        "email": email,
        "sueldo": sueldo,
        "rol": rol,
      };
}
