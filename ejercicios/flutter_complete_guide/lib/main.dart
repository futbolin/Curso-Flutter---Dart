import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}
class MyAppState extends State<MyApp> {
  String texto = "La pregunta";
  void answerQuestion() {
    setState(() {
      texto = "Ya pulso algo y se actualizó el estado";
    });
    print("Botón pulsado!");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(texto),
        ),
        body: Column(children: [
          Text("La pregunta"),
          RaisedButton(child: Text("Respuesta 1"), onPressed: answerQuestion),
          RaisedButton(child: Text("Respuesta 2"), onPressed: answerQuestion),
          RaisedButton(child: Text("Respuesta 3"), onPressed: answerQuestion)
        ]),
      ),
    );
  }


}
