import 'package:flutter/material.dart';
import 'package:toolboxprof/components/BotonPrincipalComponent.dart';
import 'package:toolboxprof/components/PantallaPrincipalComponent.dart';

class PantallaPrincipalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Presentación'), // Título de la pantalla
      ),*/
      body: Stack(
        children: [
          Container(
            child: PantallaPrincipalComponent(), // Usamos un Container como contenedor
          ),
           BotonPrincipalComponent(),
         //BotonPrincipalComponent() // Agregamos el nuevo botón aquí
        ],
      ),
    );
  }
}
