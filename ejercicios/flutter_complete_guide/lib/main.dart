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
  String pregunta = "La pregunta";
  int numeroPregunta = 0;
  answerQuestion() {
    setState(() {
    numeroPregunta++;
    });
  }

  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers' : ['Black' , 'Red', 'Green','White'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit','Snake','Elephant','Lion'],
      },
      {
        'questionText':'Who\'s your favorite instructor?',
        'answers' : ['Cualquier menos Max','Cualquiera menos Max',
          'Cualquiera menos Max','Cualquiera menos Max'],
      },
    ];


    pregunta = questions[numeroPregunta]['questionText'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("QUIZ"),
        ),
        body: Column(children: [
          Pregunta(pregunta),
          ...(questions[numeroPregunta]['answers'] as List<String>).map((answer)
          {
              return Answer(answerQuestion, answer);
          }).toList()
        ]),
      ),
    );
  }


}
