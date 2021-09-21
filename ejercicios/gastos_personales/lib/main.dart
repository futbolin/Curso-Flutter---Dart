import 'package:flutter/material.dart';
import './transaccion.dart';

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
  final List<Transaccion> transacciones = [
    Transaccion(id: "t1",titulo: "Libro",cantidad:13.33,fecha: DateTime.now()),
    Transaccion(id: "t2",titulo: "Zapatos",cantidad:30.33,fecha: DateTime.now()),
    Transaccion(id: "t3",titulo: "Cascos",cantidad:70.33,fecha: DateTime.now()),
    Transaccion(id: "t4",titulo: "Caja",cantidad:0.99,fecha: DateTime.now()),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child:Text("chart") ,
                elevation: 5,
                color: Colors.blue,
              ),
            ) ,
           Column(
             children: transacciones.map((transaccion) {
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
                           transaccion.cantidad.toString()+ "€",
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
                              transaccion.fecha.toString(),
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
           )
        ],
      ),
    );
  }
}
