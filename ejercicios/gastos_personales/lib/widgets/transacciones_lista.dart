import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../modelos/transaccion.dart';
import 'package:intl/intl.dart';

class TransaccionesLista extends StatelessWidget {
  final List<Transaccion> transaccionesDelUsuario;
  final Function eliminarTransaccion;

  TransaccionesLista(this.transaccionesDelUsuario, this.eliminarTransaccion);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 450,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: transaccionesDelUsuario.isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 200,
                        child: Image.asset("assets/images/waiting.png",
                            fit: BoxFit.cover)),
                    Text("\nTodavía no hay movimientos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ))
                  ],
                )
              : ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    transaccionesDelUsuario[index].titulo,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                      DateFormat.yMMMd().format(
                                          transaccionesDelUsuario[index].fecha),
                                      style: TextStyle(
                                        color: Colors.grey,
                                      )),
                                ]),
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              child: Container(
                                child: Text(
                                  "${transaccionesDelUsuario[index].cantidad.toStringAsFixed(2)}€",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 47, 47),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: eliminarTransaccion(
                                    transaccionesDelUsuario[index].id),
                                icon: Icon(Icons.remove)),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: transaccionesDelUsuario.length,
                ),
        ),
      ],
    );
  }
}
