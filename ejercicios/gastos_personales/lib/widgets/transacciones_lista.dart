import 'package:flutter/material.dart';
import '../modelos/transaccion.dart';
import 'package:intl/intl.dart';

class TransaccionesLista extends StatelessWidget {
  final List<Transaccion> trasaccionesDelUsuario;

  TransaccionesLista(this.trasaccionesDelUsuario);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: trasaccionesDelUsuario.map((transaccion) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    )
                ),
                padding: EdgeInsets.all(10),
                child:Text(
                  "${transaccion.cantidad}€",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: <Widget>[
                    Text(
                      transaccion.titulo,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        DateFormat.yMMMd().format(transaccion.fecha),
                        style: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ]
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
