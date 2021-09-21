import 'package:flutter/material.dart';
import '../modelos/transaccion.dart';
import './transacciones_lista.dart';
import './nueva_transaccion.dart';

class TransaccionesDelUsuario extends StatefulWidget {
  @override
  _TransaccionesDelUsuarioState createState() =>
      _TransaccionesDelUsuarioState();
}

class _TransaccionesDelUsuarioState extends State<TransaccionesDelUsuario> {
  final List<Transaccion> transaccionesDelUsuario = [
    Transaccion(
        id: "t1", titulo: "Libro", cantidad: 13.33, fecha: DateTime.now()),
    Transaccion(
        id: "t2", titulo: "Zapatos", cantidad: 30.33, fecha: DateTime.now()),
    Transaccion(
        id: "t3", titulo: "Cascos", cantidad: 70.33, fecha: DateTime.now()),
    Transaccion(
        id: "t4", titulo: "Caja", cantidad: 0.99, fecha: DateTime.now()),
  ];

  void _agregarTransaccion(String titulo, double precio) {
    final nuevaTransaccion = Transaccion(
      titulo: titulo,
      cantidad: precio,
      fecha: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      transaccionesDelUsuario.add(nuevaTransaccion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NuevaTransaccion(_agregarTransaccion),
        TransaccionesLista(transaccionesDelUsuario),
      ],
    );
  }
}
