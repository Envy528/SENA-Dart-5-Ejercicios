//ignore_for_file: dead_code

void main() {
  Map<String, int> menu = {
    'Ajiaco': 28000,
    'Bandeja paisa': 32000,
    'Sancocho': 26000,
    'Limonada': 6000,
    'Jugo natural': 7000,
    'Gaseosa': 5000,
    'Postre del día': 9000,
  };
  Map<String, int> pedido = {
    'Bandeja paisa': 2,
    'Limonada': 3,
    'Postre del día': 1,
    'Cazuela': 1, // no está en el menú
  };
  bool incluirPropina = true; // propina voluntaria del 10 %
  String medioPago = 'efectivo'; // 'efectivo' o 'debito'
  int valorRecibido = 110000; // solo para efectivo
  String? referencia; // solo para débito
  // Escriba aquí su código
  int subtotal = 0;
  for (final plato in pedido.entries) {
    if (!menu.containsKey(plato.key)) {
      print('${plato.key}: no existe en el menú, se omite');
      continue;
    }
    final totalPlato = plato.value * menu[plato.key]!;
    subtotal += totalPlato;
    print('${plato.key} x${plato.value} = ${totalPlato}');
  }

  final propina = incluirPropina ? (subtotal * 0.1).round() : 0;
  final total = incluirPropina ? subtotal + propina : subtotal;
  print('subtotal: ${subtotal} · Propina: ${propina} · Total: ${total}');

  switch (medioPago) {
    case 'efectivo':
      final cambio = valorRecibido - total;
      if (cambio > 0) {
        print('Cambio: ${cambio}');
      } else {
        print('Faltan ${cambio.abs()}');
      }
      break;
    case 'debito':
      print(
        referencia?.trim().isNotEmpty == true
            ? 'Pago confirmado'
            : 'Error: No existe referencia',
      );
      break;
    default:
      print('Medio de pago no válido');
      break;
  }
}
