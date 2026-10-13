import 'package:flutter/material.dart';

/// Muestra la imagen desde red o desde assets, con indicador de carga
/// y un respaldo (icono de huellita) si no se puede cargar.
class FotoGato extends StatelessWidget {
  final String ruta;
  final double? height;
  final double? width;

  const FotoGato({super.key, required this.ruta, this.height, this.width});

  Widget _respaldo(BuildContext context) => Container(
        height: height,
        width: width,
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.25),
        child: Icon(Icons.pets,
            size: 48, color: Theme.of(context).colorScheme.primary),
      );

  @override
  Widget build(BuildContext context) {
    if (ruta.startsWith('http')) {
      return Image.network(
        ruta,
        height: height,
        width: width,
        fit: BoxFit.cover,
        loadingBuilder: (c, child, progress) => progress == null
            ? child
            : SizedBox(
                height: height,
                width: width,
                child: const Center(child: CircularProgressIndicator()),
              ),
        errorBuilder: (c, e, s) => _respaldo(c),
      );
    }
    return Image.asset(
      ruta,
      height: height,
      width: width,
      fit: BoxFit.cover,
      errorBuilder: (c, e, s) => _respaldo(c),
    );
  }
}
