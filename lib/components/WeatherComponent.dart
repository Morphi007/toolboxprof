import 'package:flutter/material.dart';

class WeatherComponent extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  WeatherComponent({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Temperatura: ${((weatherData['main']['temp'] - 273.15).toDouble()).toStringAsFixed(2)} °C',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          'Descripción: ${weatherData['weather'][0]['description']}',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
