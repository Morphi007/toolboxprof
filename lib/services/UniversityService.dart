import 'dart:convert';
import 'package:http/http.dart' as http;

class UniversityService {
  Future<List<Map<String, dynamic>>> getUniversities(String country) async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=$country'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> universities = List<Map<String, dynamic>>.from(data);
      return universities;
    } else {
      throw Exception('Failed to load universities');
    }
  }
}
