import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart'; // Importa los iconos

import 'package:toolboxprof/screens/MenuPrincipalScreen.dart';

class BotonPrincipalComponent extends StatefulWidget {
  @override
  _BotonPrincipalComponentState createState() => _BotonPrincipalComponentState();
}

class _BotonPrincipalComponentState extends State<BotonPrincipalComponent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Reduce la duración de la animación a la mitad
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 180,
      top: MediaQuery.of(context).size.height * 0.7,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(50 * _controller.value, 0), // Mueve la flecha hacia la derecha
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => MenuPrincipalScreen()),
                );
              },
              child: Icon(
                Feather.arrow_right, // Usa una flecha hacia la derecha de flutter_vector_icons
                size: 80,
                color: Color.fromARGB(235, 35, 184, 194), // Cambia el color según sea necesario
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
