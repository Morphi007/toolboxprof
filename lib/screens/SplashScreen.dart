import 'dart:ui'; // Importante para utilizar ImageFilter y BackdropFilter
import 'package:flutter/material.dart';
import 'package:toolboxprof/screens/PantallaPrincipaScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulando una espera de 4 segundos antes de navegar a la pantalla principal
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => PantallaPrincipalScreen()),
      );
    });

    return Scaffold(
      backgroundColor:Colors.black, // Color de fondo del SplashScreen
      body: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Aplicar un ligero desenfoque para simular mayor resolución
          child: Image.asset(
            'assets/splash.gif', // Ruta del archivo GIF en los activos
            width: 900, // Ajusta el ancho según tus necesidades
            height: 900, // Ajusta la altura según tus necesidades
          ),
        ),
      ),
    );
  }
}