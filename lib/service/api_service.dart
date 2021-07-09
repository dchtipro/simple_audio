import 'dart:convert' as json;
import 'package:http/http.dart' as http;
import 'package:audio_player_liontude/app/data/models/headlines_model.dart';

class ApiService {
  Future<Headlines> fetchHeadLines() async {
    final response = await http.get(
      Uri.https('newsapi.org', 'v2/top-headlines', {'country': 'us'}),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'x-api-key': '278d62e57ebc427682bc5587a9a46b07',
      },
    );
    print('despues del response');
    print(response.body);
    print('antes del if');
    if (response.statusCode == 200) {
      return Headlines.fromJson(json.jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Combinations');
    }
  }
}
