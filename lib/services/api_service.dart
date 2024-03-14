import 'dart:convert';
import 'package:http/http.dart' as http;

class GenderPredictionService {
  Future<String> getGender(String name) async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      String gender = data['gender'];
      return gender;
    } else {
      throw Exception('Failed to load gender prediction');
    }
  }
}
