
import 'package:flutter/material.dart';
import 'package:toolboxprof/components/AgePredictionComponent.dart';
class AgePredictionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presentación'), // Título de la pantalla
      ),
      body: Center(
        child:AgePredictionComponent() , // Mostramos el componente de presentación
      ),
    );
  }
}
