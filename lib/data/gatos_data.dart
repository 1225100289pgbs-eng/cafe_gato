import '../models/gato.dart';

// Mock data. Para usar tus propias fotos, cambia 'imagen' por
// 'assets/images/mi_gato.jpg' y declara la carpeta en pubspec.yaml.
const List<String> categorias = ['Todos', 'Transtortados', 'Juguetones', 'Tranquilos'];

const List<Gato> gatos = [
  Gato(
    id: 1,
    nombre: 'Felix',
    raza: 'Bombay',
    categoria: 'Tranquilos',
    edadMeses: 36,
    rating: 5,
    precioVisita: 80,
    descripcion: 'Este amigo felino siempre esta feliz estar con el te traera una dosis de alegria',
    historia:
        'Mochi llegó al café siendo un gatito rescatado de una bodega. Hoy es el '
        'rey de la ventana soleada y suele acompañar a quienes vienen a leer o '
        'estudiar. No le gusta correr, pero ama los mimos suaves.',
    personalidad: 'Calmado, cariñoso, dormilón',
    imagen: 'assets/images/felix.jpg',
  ),
  Gato(
    id: 2,
    nombre: 'Marci',
    raza: 'de otro mundo',
    categoria: 'Juguetones',
    edadMeses: 18,
    rating: 4.7,
    precioVisita: 80,
    descripcion: 'Su compañia es algo diferente a las demas',
    historia:
        'Marci es proveniente de una raza superior,'
        'fue encontrado en el patio trasero de la cafeteria, brillaba tanto en esa noche oscura que'
        'era dificil de ignorar',
    personalidad: 'Enérgica, curiosa, sociable',
    imagen: 'assets/images/marci.png',
  ),
  Gato(
    id: 3,
    nombre: 'Chiquitin',
    raza: 'Blanco',
    categoria: 'Cachorros',
    edadMeses: 4,
    rating: 4.8,
    precioVisita: 100,
    descripcion: 'Es una bolita de pelo muy linda, y ansiosa...',
    historia:
        'Este pequeño fue encontrado abandonado abajo de un puente'
        'fue rescatado y ahora vive bien aunque aveces recuerda su pasado fluctuoso'
        'le encanta estar acompañado, es muy cariñoso y gran compañia',
    personalidad: 'cariñoso, tierno, ansioso',
    imagen: 'assets/images/noFelix.jpg',
  ),
  Gato(
    id: 4,
    nombre: 'Gandalf',
    raza: 'Maine Coon',
    categoria: 'Transtornados',
    edadMeses: 60,
    rating: 4.6,
    precioVisita: 90,
    descripcion: 'Grande, peludo y con aire de sabio.',
    historia:
        'Gandalf es el gigante gentil de la casa. Pesa más de 7 kilos y le '
        'gusta observar todo desde lo alto del librero. Acepta cepillados y '
        'se deja cargar solo si confía en ti.',
    personalidad: 'Sabio, paciente, independiente',
    imagen: 'assets/images/oli.jpg',
  ),
  Gato(
    id: 5,
    nombre: 'Pixel',
    raza: 'Bengalí',
    categoria: 'Juguetones',
    edadMeses: 24,
    rating: 4.5,
    precioVisita: 90,
    descripcion: 'Atleta del café: salta, corre y explora.',
    historia:
        'Pixel tiene pelaje de pequeño leopardo y mucha energía. Su juego '
        'favorito es perseguir el puntero láser y escalar el rascador de tres '
        'pisos. Ideal para quienes buscan diversión.',
    personalidad: 'Atlético, aventurero, listo',
    imagen: 'assets/images/rey.jpg',
  ),
  Gato(
    id: 6,
    nombre: 'Nube',
    raza: 'Persa',
    categoria: 'Cachorros',
    edadMeses: 6,
    rating: 4.9,
    precioVisita: 100,
    descripcion: 'Suave como algodón y muy dulce.',
    historia:
        'Nube es una gatita blanca de pelo largo que adora que la carguen. '
        'Necesita cepillado diario, y los clientes que ayudan a peinarla '
        'se vuelven sus mejores amigos.',
    personalidad: 'Dulce, tímida al inicio, mimosa',
    imagen: 'assets/images/richi.jpg',
  ),
];
