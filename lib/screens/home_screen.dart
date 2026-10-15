import 'package:flutter/material.dart';
import '../data/gatos_data.dart';
import '../models/gato.dart';
import '../widgets/gato_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _busqueda = '';
  String _categoria = 'Todos';
  final Set<int> _favoritos = {};

  List<Gato> get _filtrados => gatos.where((g) {
        final coincideCategoria = _categoria == 'Todos' || g.categoria == _categoria;
        final coincideBusqueda =
            g.nombre.toLowerCase().contains(_busqueda.toLowerCase()) ||
                g.raza.toLowerCase().contains(_busqueda.toLowerCase());
        return coincideCategoria && coincideBusqueda;
      }).toList();

  void _toggleFavorito(int id) {
    setState(() {
      _favoritos.contains(id) ? _favoritos.remove(id) : _favoritos.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final lista = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Miau Café ',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: colores.primary,
        foregroundColor: Colors.white,
        actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Miau Café'),
              content: const Text(
                  'Cafetería con gatitos residentes.\n\n'
                  'Horario: 10:00 a 20:00\n'
                  'Reserva tu mesa y conoce a nuestros residentes.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cerrar'),
                ),
              ],
            ),
          ),
        ),
      ],
      ),  
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colores.secondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text(
              '☕ Toma un café rodeado de gatitos. Conoce a nuestros residentes '
              'y reserva tu mesa.',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(height: 12),
            // Barra de búsqueda funcional
            TextField(
              onChanged: (v) => setState(() => _busqueda = v),
              decoration: InputDecoration(
                hintText: 'Busca un residente por nombre o raza',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Categorías con chips
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final cat = categorias[i];
                  return ChoiceChip(
                    label: Text(cat),
                    selected: _categoria == cat,
                    selectedColor: colores.secondary,
                    onSelected: (_) => setState(() => _categoria = cat),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Text('${lista.length} gatitos residentes',
                style: const TextStyle(color: Colors.black54)),
            // Lista dinámica
            Expanded(
              child: lista.isEmpty
                  ? const Center(child: Text('No encontramos gatitos 😿'))
                  : ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, i) {
                        final gato = lista[i];
                        return GatoCard(
                          gato: gato,
                          esFavorito: _favoritos.contains(gato.id),
                          onTap: () async {
                            // Se pasa el objeto completo a la pantalla de detalle
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailScreen(
                                  gato: gato,
                                  esFavoritoInicial: _favoritos.contains(gato.id),
                                  onToggleFavorito: () => _toggleFavorito(gato.id),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
