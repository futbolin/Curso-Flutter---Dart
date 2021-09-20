import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function eventHandler;
  final String texto;

  Answer(this.eventHandler, this.texto);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(this.texto),
        onPressed: eventHandler,
    ),

    );
  }
}
