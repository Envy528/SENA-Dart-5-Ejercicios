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
    'Ajiaco': 3,
    'Jugo natural': 4,
    'Postre del día': 2,
    'Bandeja paisa': 1,
  };
  String? cupon = 'CUMPLE'; // puede ser null si no hay cupón
  bool clienteFrecuente = true;
  const int descuentoMaximo = 20; // porcentaje máximo
  // Escriba aquí su código

  // Subtotal
  int subtotal = 0;
  for (final plato in pedido.entries) {
    subtotal += plato.value * menu[plato.key]!;
  }
  print("Subtotal: $subtotal");
  // Descuentos
  List<String> motivos = [];
  int descuentos = 0;
  if (subtotal >= 150000) {
    descuentos += 10;
    motivos.add("compra mayor a 150.000 (10 %)");
  }
  // Descuento por cupon
  if (cupon != null) {
    if (cupon.toUpperCase() == "CUMPLE") {
      descuentos += 15;
      motivos.add("cupón CUMPLE (15 %)");
    } else if (cupon.toUpperCase() == "ESTUDIANTE") {
      descuentos += 5;
      motivos.add("cupón ESTUDIANTE (5 %)");
    } else {
      print("Cupon no valido, no hay descuento");
    }
  } else {
    print("No se encontro cupón.");
  }
  // Descuento por cliente frecuente
  if (clienteFrecuente) {
    descuentos += 5;
    motivos.add("cliente frecuente (5 %)");
  }
  // Tope de descuento
  if (descuentos > descuentoMaximo) {
    print("El descuento de $descuentos % supera el máximo; se aplica 20%");
    descuentos = descuentoMaximo;
  }
  // Descuento y total a pagar
  print(
    "Descuento: ${subtotal * descuentos ~/ 100} · TOTAL A PAGAR: ${subtotal - (subtotal * descuentos ~/ 100)}",
  );

  //Motivos
  print("Motivos: ${motivos.join(", ")}");
}