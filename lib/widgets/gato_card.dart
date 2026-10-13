import 'package:flutter/material.dart';
import '../models/gato.dart';
import 'foto_gato.dart';

class GatoCard extends StatelessWidget {
  final Gato gato;
  final bool esFavorito;
  final VoidCallback onTap;

  const GatoCard({
    super.key,
    required this.gato,
    required this.esFavorito,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Hero(
              tag: 'gato-${gato.id}',
              child: FotoGato(ruta: gato.imagen, height: 120, width: 120),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            gato.nombre,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        if (esFavorito)
                          const Icon(Icons.favorite,
                              color: Colors.redAccent, size: 20),
                      ],
                    ),
                    Text(gato.raza,
                        style: TextStyle(color: colores.primary, fontSize: 13)),
                    const SizedBox(height: 6),
                    Text(
                      gato.descripcion,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(gato.rating.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
