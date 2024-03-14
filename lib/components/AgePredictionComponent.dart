import 'package:flutter/material.dart';
import 'package:toolboxprof/services/AgendaPredictionService.dart';

class AgePredictionComponent extends StatefulWidget {
  @override
  _AgePredictionComponentState createState() => _AgePredictionComponentState();
}

class _AgePredictionComponentState extends State<AgePredictionComponent> {
  AgePredictionService _agePredictionService = AgePredictionService();
  String _name = '';
  int _age = 0;
  bool _loading = false;

  void _predictAge() async {
    setState(() {
      _loading = true;
    });
    try {
      int age = await _agePredictionService.getAge(_name);
      setState(() {
        _age = age;
        _loading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _loading = false;
      });
    }
  }

  String _getAgeCategory() {
    if (_age < 18) {
      return 'Joven';
    } else if (_age >= 18 && _age < 60) {
      return 'Adulto';
    } else {
      return 'Anciano';
    }
  }
/*
  String _getImageUrlForAgeCategory() {
    if (_age < 18) {
      return 'https://example.com/joven.png'; // URL de la imagen para jóvenes
    } else if (_age >= 18 && _age < 60) {
      return 'https://example.com/adulto.png'; // URL de la imagen para adultos
    } else {
      return 'https://example.com/anciano.png'; // URL de la imagen para ancianos
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Edad predicha:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        _age != 0
            ? Column(
                children: [
                  /*Image.network(
                    _getImageUrlForAgeCategory(),
                    width: 100,
                    height: 100,
                  ),*/
                  Text(
                    'Edad: $_age años',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Categoría de edad: ${_getAgeCategory()}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )
            : Container(),
        SizedBox(height: 16),
        TextField(
          onChanged: (value) {
            setState(() {
              _name = value;
            });
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Ingrese un nombre',
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _predictAge,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
          child: Icon(Icons.search),
        ),
        SizedBox(height: 16),
        _loading
            ? CircularProgressIndicator()
            : Container(),
      ],
    );
  }
}
