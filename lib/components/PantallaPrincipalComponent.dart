import 'package:flutter/material.dart';

class PantallaPrincipalComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo de imagen con efecto glassmorphism
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/gradiente.png'), // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Color de la sombra con opacidad
                blurRadius: 90.0, // Radio de desenfoque
                spreadRadius: 10.0, // Radio de dispersión
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Morphy Martinez De oleo', // Aquí puedes colocar el nombre del usuario
              style: TextStyle(fontSize: 20, color: Colors.white), // Color del texto blanco para contraste
            ),
          ),
        ),
        // Imagen encima de todo
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/herramienta.png', // Ruta de tu imagen de logo
            fit: BoxFit.contain, // Ajuste de la imagen dentro del contenedor
          ),
        ),
      ],
    );
  }
}
