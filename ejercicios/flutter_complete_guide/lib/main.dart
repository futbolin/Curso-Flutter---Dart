import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("La barra de mi app"),
        ),
        body: Column(children: [
          Text("La pregunta"),
          RaisedButton(child: Text("Respuesta 1"), onPressed: null),
          RaisedButton(child: Text("Respuesta 2"), onPressed: null),
          RaisedButton(child: Text("Respuesta 3"), onPressed: null)
        ]),
      ),
    );
  }
}
