import 'package:flutter/material.dart';
import '../modelos/transaccion.dart';
import 'package:intl/intl.dart';

class TransaccionesLista extends StatelessWidget {
  final List<Transaccion> transaccionesDelUsuario;

  TransaccionesLista(this.transaccionesDelUsuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 10,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 47, 47),
                        width: 2,
                      )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${transaccionesDelUsuario[index].cantidad.toStringAsFixed(2)}€",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 47, 47),
                    ),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        transaccionesDelUsuario[index].titulo,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(DateFormat.yMMMd().format(transaccionesDelUsuario[index].fecha),
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                    ])
              ],
            ),
          );
        },
        itemCount: transaccionesDelUsuario.length,
      ),
    );
  }
}
