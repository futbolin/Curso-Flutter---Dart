import 'package:flutter/material.dart';

class GraficoBarra extends StatelessWidget {
  final String etiqueta;
  final double cantidad;
  final double cantidadDelTotal;

  GraficoBarra(this.etiqueta, this.cantidad, this.cantidadDelTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${cantidad.toStringAsFixed(2)}€"),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 47, 0),
                    width: 1.0,
                  ),
                  color: Color.fromARGB(255, 235, 235, 235),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
        FractionallySizedBox(
            heightFactor: cantidadDelTotal,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 47, 0),
                  borderRadius: BorderRadius.circular(10)),
            )),
        SizedBox(
          height: 4,
        )
      ],
    );
  }
}
