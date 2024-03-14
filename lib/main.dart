import 'package:flutter/material.dart';
import 'package:toolboxprof/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Welcome to Flutter',
      home: Scaffold(
        /*appBar: AppBar(
          title: Text('Presentación'), // Título de la pantalla
        ),*/
        body: Stack(
          children: [
            Container(
              //color: Color(0xFF030708),
              child: SplashScreen(), // Aquí se utiliza SliderPantallaPrincipalComponent
            ),
            // Agregamos el nuevo botón aquí
          ],
        ),
      ),
    );
  }
}
