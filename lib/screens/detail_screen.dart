import 'package:flutter/material.dart';
import '../models/gato.dart';
import '../widgets/foto_gato.dart';

class DetailScreen extends StatefulWidget {
  final Gato gato;
  final bool esFavoritoInicial;
  final VoidCallback onToggleFavorito;

  const DetailScreen({
    super.key,
    required this.gato,
    required this.esFavoritoInicial,
    required this.onToggleFavorito,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool _favorito = widget.esFavoritoInicial;

  void _reservar() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('¡Visita reservada! 🐱'),
        content: Text(
            'Reservaste una hora con ${widget.gato.nombre} por \$${widget.gato.precioVisita.toStringAsFixed(0)} MXN. '
            'Incluye una bebida caliente.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Genial'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final g = widget.gato;
    final colores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(g.nombre),
        backgroundColor: colores.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_favorito ? Icons.favorite : Icons.favorite_border,
                color: _favorito ? Colors.redAccent : Colors.white),
            onPressed: () {
              widget.onToggleFavorito();
              setState(() => _favorito = !_favorito);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Imagen destacada con Hero
          Hero(
            tag: 'gato-${g.id}',
            child: FotoGato(ruta: g.imagen, height: 280, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(g.nombre,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold)),
                Text(g.raza,
                    style: TextStyle(fontSize: 16, color: colores.primary)),
                const SizedBox(height: 16),
                // Iconos informativos
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Dato(icono: Icons.cake, titulo: 'Edad', valor: g.edadTexto),
                    _Dato(
                        icono: Icons.star,
                        titulo: 'Calificación',
                        valor: g.rating.toString(),
                        color: Colors.amber),
                    _Dato(
                        icono: Icons.attach_money,
                        titulo: 'Visita/hora',
                        valor: '\$${g.precioVisita.toStringAsFixed(0)}'),
                  ],
                ),
                const SizedBox(height: 24),
                _Bloque(titulo: 'Su historia', texto: g.historia),
                const SizedBox(height: 16),
                _Bloque(titulo: 'Personalidad', texto: g.personalidad),
                const SizedBox(height: 16),
                _Bloque(titulo: 'Categoría', texto: g.categoria),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: _reservar,
                    icon: const Icon(Icons.event_available),
                    label: const Text('Reservar visita',
                        style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colores.secondary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Dato extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String valor;
  final Color? color;

  const _Dato({
    required this.icono,
    required this.titulo,
    required this.valor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icono, size: 30, color: color ?? Theme.of(context).colorScheme.primary),
        const SizedBox(height: 4),
        Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(titulo, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}

class _Bloque extends StatelessWidget {
  final String titulo;
  final String texto;
  const _Bloque({required this.titulo, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(texto, style: const TextStyle(fontSize: 15, height: 1.4)),
      ],
    );
  }
}
