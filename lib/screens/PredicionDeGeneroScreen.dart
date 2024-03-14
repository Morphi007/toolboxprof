import 'package:flutter/material.dart';
import 'package:toolboxprof/components/PredicionDeGeneroComponent.dart';

class PrediccionDeGeneroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: PrediccionDeGeneroComponent(),
      ),
    );
  }
}
