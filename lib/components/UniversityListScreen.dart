import 'package:flutter/material.dart';
import 'package:toolboxprof/services/UniversityService.dart';

class UniversityListScreen extends StatefulWidget {
  final String country;

  UniversityListScreen({required this.country});

  @override
  _UniversityListScreenState createState() => _UniversityListScreenState();
}

class _UniversityListScreenState extends State<UniversityListScreen> {
  UniversityService _universityService = UniversityService();
  late List<Map<String, dynamic>> _universities;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadUniversities();
  }

  void _loadUniversities() async {
    try {
      List<Map<String, dynamic>> universities = await _universityService.getUniversities(widget.country);
      setState(() {
        _universities = universities;
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
        title: Text('Universidades en ${widget.country}'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _universities.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> university = _universities[index];
                return ListTile(
                  title: Text(university['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dominio: ${university['domains'].first}'),
                      Text('Página web: ${university['web_pages'].first}'),
                    ],
                  ),
                  onTap: () {
                    // Aquí puedes agregar la lógica para manejar la selección de una universidad
                  },
                );
              },
            ),
    );
  }
}
