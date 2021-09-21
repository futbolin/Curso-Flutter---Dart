import 'package:flutter/material.dart';
import 'modelos/transaccion.dart';
import 'widgets/transacciones_lista.dart';
import 'widgets/transacciones_del_usuario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String tituloEntrada;
    String precioEntrada;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 47, 187),
        title: Text('Flutter App'),
      ),
      body: Container(
        color: Color.fromARGB(255, 240, 240, 240),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text("chart"),
                  elevation: 5,
                  color: Color.fromARGB(255, 0, 47, 187),
                ),
              ),
              TransaccionesDelUsuario(),
            ],
          ),
        ),
      ),
    );
  }
}
