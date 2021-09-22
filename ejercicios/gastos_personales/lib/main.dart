import 'package:flutter/material.dart';
import '/widgets/grafico.dart';
import 'widgets/transacciones_lista.dart';
import 'modelos/transaccion.dart';
import 'widgets/nueva_transaccion.dart';

void main() => runApp(MyApp());
Map<int, Color> color = {
  50: Color.fromRGBO(0, 47, 187, .1),
  100: Color.fromRGBO(0, 47, 187, .2),
  200: Color.fromRGBO(0, 47, 187, .3),
  300: Color.fromRGBO(0, 47, 187, .4),
  400: Color.fromRGBO(0, 47, 187, .5),
  500: Color.fromRGBO(0, 47, 187, .6),
  600: Color.fromRGBO(0, 47, 187, .7),
  700: Color.fromRGBO(0, 47, 187, .8),
  800: Color.fromRGBO(0, 47, 187, .9),
  900: Color.fromRGBO(0, 47, 187, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF002fa7, color);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gastos App',
      theme: ThemeData(
        primarySwatch: colorCustom,
        fontFamily: "OpenSans",
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaccion> transaccionesDelUsuario = [
    Transaccion(
        id: "t1",
        titulo: "Libro",
        cantidad: 13.33,
        fecha: DateTime.now().subtract(Duration(days: 1))),
    Transaccion(
        id: "t2",
        titulo: "Zapatos",
        cantidad: 30.33,
        fecha: DateTime.now().subtract(Duration(days: 2))),
    Transaccion(
        id: "t3",
        titulo: "Cascos",
        cantidad: 70.33,
        fecha: DateTime.now().subtract(Duration(days: 3))),
    Transaccion(
        id: "t4",
        titulo: "Caja",
        cantidad: 0.99,
        fecha: DateTime.now().subtract(Duration(days: 4))),
    Transaccion(
        id: "t5",
        titulo: "Colacoca",
        cantidad: 45.99,
        fecha: DateTime.now().subtract(Duration(days: 5))),
    Transaccion(
        id: "t6",
        titulo: "Pañuelos",
        cantidad: 57.99,
        fecha: DateTime.now().subtract(Duration(days: 6))),
    Transaccion(
        id: "t7",
        titulo: "Series B ",
        cantidad: 5.99,
        fecha: DateTime.now().subtract(Duration(days: 7))),
    Transaccion(
        id: "t8",
        titulo: "Ifone",
        cantidad: 66.99,
        fecha: DateTime.now().subtract(Duration(days: 1))),
    Transaccion(
        id: "t9",
        titulo: "Cafe",
        cantidad: 90.99,
        fecha: DateTime.now().subtract(Duration(days: 1))),
  ];

  List<Transaccion> get transaccionesRecientes {
    return transaccionesDelUsuario.where((transaccion) {
      return transaccion.fecha.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _agregarTransaccion(String titulo, double precio,DateTime fecha) {
    final nuevaTransaccion = Transaccion(
      titulo: titulo,
      cantidad: precio,
      fecha: fecha,
      id: DateTime.now().toString(),
    );

    setState(() {
      transaccionesDelUsuario.add(nuevaTransaccion);
    });
  }

  void _startNuevaTransaccion(BuildContext contexto) {
    showModalBottomSheet(
      context: contexto,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NuevaTransaccion(_agregarTransaccion),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 47, 187),
        title: Text('Gastos App'),
        actions: [
          IconButton(
            onPressed: () => _startNuevaTransaccion(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Grafico(transaccionesDelUsuario),
            SingleChildScrollView(
                child: TransaccionesLista(transaccionesRecientes)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startNuevaTransaccion(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
