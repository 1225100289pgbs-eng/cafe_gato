class Gato {
  final int id;
  final String nombre;
  final String raza;
  final String categoria; // Cachorros, Juguetones, Tranquilos
  final int edadMeses;
  final double rating;
  final double precioVisita; // MXN por hora
  final String descripcion; // breve (para la tarjeta)
  final String historia; // larga (para el detalle)
  final String personalidad;
  final String imagen; // URL (http...) o ruta de asset

  const Gato({
    required this.id,
    required this.nombre,
    required this.raza,
    required this.categoria,
    required this.edadMeses,
    required this.rating,
    required this.precioVisita,
    required this.descripcion,
    required this.historia,
    required this.personalidad,
    required this.imagen,
  });

  String get edadTexto {
    if (edadMeses < 12) return '$edadMeses meses';
    final anos = edadMeses ~/ 12;
    return anos == 1 ? '1 año' : '$anos años';
  }
}
