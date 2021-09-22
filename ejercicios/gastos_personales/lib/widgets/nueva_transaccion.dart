import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NuevaTransaccion extends StatefulWidget {
  final Function agregarTransaccion;

  NuevaTransaccion(this.agregarTransaccion);

  @override
  State<NuevaTransaccion> createState() => _NuevaTransaccionState();
}

class _NuevaTransaccionState extends State<NuevaTransaccion> {
  final tituloControlador = TextEditingController();

  final precioControlador = TextEditingController();

  DateTime? fechaEscogida;

  void startEscogerFecha() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        fechaEscogida = value;
      });
    });
  }

  void submit() {
    if (tituloControlador.text != "" &&
        double.tryParse(precioControlador.text)! > 0) {
      widget.agregarTransaccion(
          tituloControlador.text, double.parse(precioControlador.text),fechaEscogida);
    } else {
      return;
    }

    Navigator.of(context).pop();
  }

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
              onSubmitted: (val) => submit(),
            ),
            TextField(
              controller: precioControlador,
              decoration: InputDecoration(
                labelText: "Precio",
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (val) => submit(),
            ),
            Row(
              children: [
                Text(fechaEscogida != null
                    ? DateFormat.yMd().format(fechaEscogida)
                    : "Sin fecha escogida!"),
                Expanded(
                  child: FlatButton(
                      onPressed: startEscogerFecha, child: Text("Escoger fecha")),
                )
              ],
            ),
            RaisedButton(
              textColor: Color.fromARGB(255, 0, 47, 0),
              onPressed: () {
                submit();
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
