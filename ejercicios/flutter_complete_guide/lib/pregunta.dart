import 'package:flutter/material.dart';


class Pregunta extends StatelessWidget {
  final String txtPregunta;
  Pregunta(this.txtPregunta);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child:Text(txtPregunta,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
