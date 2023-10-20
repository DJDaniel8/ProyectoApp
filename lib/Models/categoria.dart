class Categoria {
  final int categoriaId;
  String nombre;

  Categoria({
    required this.categoriaId,
    required this.nombre,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        categoriaId: json["categoriaId"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "categoriaId": categoriaId,
        "nombre": nombre,
      };
}
