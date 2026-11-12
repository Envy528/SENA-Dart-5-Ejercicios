

void main() {
  String usuario = 'Laura';
  String rol = 'cajero'; // puede ser 'admin', 'cajero' o 'mesero'
  bool cajaAbierta = false;
  int baseInicial = 200000;
  const int baseMaxima = 10000000;
  List<String> movimientos = [];
  // Escriba aquí su código

  if (cajaAbierta == true) {
    print('Error: ya hay una caja abierta');
  } else if (rol != 'cajero' && rol != 'admin') {
    print(
      'Error: Solo los cajeros y los administradores pueden abrir una caja',
    );
  } else if (baseInicial < 0) {
    print('Error: La base inicial es negativa');
  } else if (baseInicial > baseMaxima) {
    print('Error: La base inicial es superior a la base máxima');
  } else {
    cajaAbierta = true;
    movimientos.add('APERTURA por ${usuario} con base ${baseInicial}');
    print('Caja abierta por ${usuario} con una base de ${baseInicial}');

    print('Movimientos: ${movimientos}');
  }
  print('Estado de la caja: ${cajaAbierta ? 'ABIERTA' : 'CERRADA'}');
}
