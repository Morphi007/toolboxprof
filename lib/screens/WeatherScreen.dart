import 'package:flutter/material.dart';
import 'package:toolboxprof/components/WeatherComponent.dart';
import 'package:toolboxprof/services/WeatherService.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Map<String, dynamic> _weatherData;
  bool _loading = true;
  final WeatherService weatherService = WeatherService(
    apiKey: '8da6a92085c35562f473f11ec2bbe7cd',
    baseUrl: 'https://api.openweathermap.org/data/2.5/weather',
  );

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      Map<String, dynamic> weatherData = await weatherService.getWeather('Santo Domingo');
      setState(() {
        _weatherData = weatherData;
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Republica Dominicana'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : WeatherComponent(weatherData: _weatherData),
    );
  }
}
