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
  Map<String, int> venta = {'Sancocho': 2, 'Gaseosa': 3, 'Postre del día': 2};
  String productoDevuelto = 'Gaseosa';
  int cantidadDevuelta = 1;
  String motivo = 'Producto en mal estado';
  bool autorizadoPorAdmin = false;
  const int limiteSinAutorizacion = 30000;
  List<String> devoluciones = [];
  // Escriba aquí su código
  // subtotal
  int subtotal = 0;
  for (final plato in venta.entries) {
    subtotal += plato.value * menu[plato.key]!;
  }
  // validaciones
  if (!venta.containsKey(productoDevuelto)) {
    print("Error: el producto $productoDevuelto no hace parte de la venta");
  } else if (cantidadDevuelta <= 0) {
    print(
      "Error: la cantidad a devolver del $productoDevuelto no es mayor a 0",
    );
  } else if (cantidadDevuelta > venta[productoDevuelto]!) {
    print("Error: la cantidad a devolver es mayor a la cantidad vendida");
  } else {
    // calcular valor de devolucion
    int valorDevolucion = cantidadDevuelta * menu[productoDevuelto]!;
    if (valorDevolucion > limiteSinAutorizacion &&
        autorizadoPorAdmin == false) {
      print(
        "Aviso: el valor a devolver supera el limite de $limiteSinAutorizacion y no hay autorización, no se han hecho cambios.",
      );
    } else {
      if (venta[productoDevuelto]! - cantidadDevuelta == 0) {
        venta.remove(productoDevuelto);
      } else {
        venta[productoDevuelto] = venta[productoDevuelto]! - cantidadDevuelta;
      }
      devoluciones.add(
        "$cantidadDevuelta x $productoDevuelto ($motivo): $valorDevolucion",
      );
      print("Total original: $subtotal");
      print("Devolución registrada: $valorDevolucion");
      print("Venta actualizada: $venta");
      print("Nuevo total: ${subtotal - valorDevolucion}");
      print("Devoluciones: $devoluciones");
    }
  }
}
