import 'package:http/http.dart' as http;
import 'dart:convert';

class AgePredictionService {
  Future<int> getAge(String name) async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=$name'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      int age = data['age'];
      return age;
    } else {
      throw Exception('Failed to load age prediction');
    }
  }
}
