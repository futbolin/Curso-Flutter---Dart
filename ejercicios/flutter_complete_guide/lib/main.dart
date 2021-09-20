import 'package:flutter/material.dart';
import './pregunta.dart';
import './answer.dart';


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
  answerQuestion() {
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
          Pregunta("La pregunta"),
          Answer(answerQuestion),
          Answer(answerQuestion),
          Answer(answerQuestion)

        ]),
      ),
    );
  }


}
