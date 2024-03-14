import 'package:flutter/material.dart';
import 'package:toolboxprof/services/api_service.dart';

class PrediccionDeGeneroComponent extends StatefulWidget {
  @override
  _PrediccionDeGeneroComponentState createState() =>
      _PrediccionDeGeneroComponentState();
}

class _PrediccionDeGeneroComponentState
    extends State<PrediccionDeGeneroComponent> {
  GenderPredictionService _genderPredictionService =
      GenderPredictionService();
  String _name = '';
  String _gender = '';
  bool _loading = false;

  void _predictGender() async {
    setState(() {
      _loading = true;
    });
    try {
      String gender = await _genderPredictionService.getGender(_name);
      setState(() {
        _gender = gender;
        _loading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Género predicho:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        _gender.isNotEmpty
            ? Text(
                _gender,
                style: TextStyle(
                  color: _gender == 'male' ? Colors.blue : Colors.pink,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
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
          onPressed: _predictGender,
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
