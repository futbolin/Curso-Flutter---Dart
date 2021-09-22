import 'package:flutter/material.dart';
import '../modelos/transaccion.dart';
import 'package:intl/intl.dart';
import 'grafico_barra.dart';

class Grafico extends StatelessWidget {
  final List<Transaccion> transaccionesRecientes;

  Grafico(this.transaccionesRecientes);

  List<Map<String, Object>> get transaccionesAgrupadasPorValor {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0;
      for (int i = 0; i < transaccionesRecientes.length; i++) {
        if (transaccionesRecientes[i].fecha.day == weekDay.day &&
            transaccionesRecientes[i].fecha.month == weekDay.month &&
            transaccionesRecientes[i].fecha.year == weekDay.year) {
          totalSum += transaccionesRecientes[i].cantidad;
        }
      }
      return {
        "dia": DateFormat.E().format(weekDay).substring(0, 1),
        "cantidad": totalSum
      };
    });
  }

  double get totalGastado {
    return transaccionesAgrupadasPorValor.fold(0.0, (suma, element) {
      return suma + (element["cantidad"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: transaccionesAgrupadasPorValor.map((datos) {
            return Flexible(
              fit: FlexFit.tight,
              child: GraficoBarra(
                  datos["dia"] as String,
                  datos["cantidad"] as double,
                  totalGastado != 0
                      ? ((datos["cantidad"] as double) / totalGastado)
                      : 0),
            );
          }).toList(),
        ),
      ),
    );
  }
}
