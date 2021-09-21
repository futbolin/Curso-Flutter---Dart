import 'package:flutter/material.dart';

class NuevaTransaccion extends StatelessWidget {
  final Function agregarTransaccion;
  final tituloControlador = TextEditingController();
  final precioControlador = TextEditingController();

  NuevaTransaccion(this.agregarTransaccion);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: tituloControlador,
              decoration: InputDecoration(
                labelText: "Titulo de compra",
              ),
            ),
            TextField(
              controller: precioControlador,
              decoration: InputDecoration(
                labelText: "Precio",
              ),
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: () {
                agregarTransaccion(tituloControlador.text,
                    double.tryParse(precioControlador.text));
              },
              child: Text(
                "Añadir Movimiento",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
