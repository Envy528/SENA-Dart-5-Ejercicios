void main() {
  int baseInicial = 200000;
  // Las dos listas van en el mismo orden: la venta i se pagó con el medio i
  List<int> totales = [45000, 120000, 38000, 76000, 54000, 91000];
  List<String> medios = [
    'efectivo',
    'debito',
    'efectivo',
    'credito',
    'efectivo',
    'debito',
  ];
  Map<String, int> egresos = {
    'Compra de hielo': 15000,
    'Recarga de gas': 20000,
  };
  int efectivoContado = 300000;
  // Escriba aquí su código
  // Agregar nueva venta
  totales.add(200000);
  medios.add('efectivo');
  // Map de porMedio
  Map<String, int> porMedio = {"efectivo": 0, "debito": 0, "credito": 0};
  for (int i = 0; i < totales.length; i++) {
    String medio = medios[i];
    int total = totales[i];
    porMedio[medio] = porMedio[medio]! + total;
  }
  print(
    "Ventas en efectivo: ${porMedio['efectivo']} · débito: ${porMedio['debito']} · crédito: ${porMedio['credito']}",
  );

  // Total vendido, cantidad de ventas, venta mayor y promedio por venta
  int totalVendido = 0;
  int ventaMayor = 0;
  for (final dinero in totales) {
    totalVendido += dinero;
    if (dinero > ventaMayor) {
      ventaMayor = dinero;
    }
  }
  double promedio = totalVendido / totales.length;
  print(
    "Total vendido: $totalVendido (${totales.length} ventas) · Venta mayor: $ventaMayor · Promedio: ${promedio.toStringAsFixed(0)}",
  );
  // egresos
  int totalEgresos = 0;
  for (final egreso in egresos.values) {
    totalEgresos += egreso;
  }
  print("Egresos: $totalEgresos");

  // Efectivo esperado
  int efectivoEsperado = baseInicial + porMedio['efectivo']! - totalEgresos;
  // Comparación con el efectivo contado
  print(
    "Efectivo esperado: $efectivoEsperado · Efectivo contado: $efectivoContado",
  );
  if (efectivoEsperado == efectivoContado) {
    print("Caja cuadrada");
  } else if (efectivoEsperado > efectivoContado) {
    print("Faltante de ${efectivoEsperado - efectivoContado}");
  } else {
    print("Sobrante de ${efectivoContado - efectivoEsperado}");
  }
}
