import 'package:flutter/material.dart';
import 'package:toolboxprof/components/UniversityListScreen.dart';

class MainScreen extends StatelessWidget {
  final TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _countryController,
              decoration: InputDecoration(
                labelText: 'Nombre del país',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String country = _countryController.text.trim();
                if (country.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UniversityListScreen(country: country),
                    ),
                  );
                } else {
                  // Mostrar mensaje de error o manejar la entrada vacía
                }
              },
              child: Text('Buscar Universidades'),
            ),
          ],
        ),
      ),
    );
  }
}
