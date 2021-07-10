import 'package:get/get.dart';

import '../models/questions_model.dart';

class QuestionsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Questions.fromJson(map);
      if (map is List)
        return map.map((item) => Questions.fromJson(item)).toList();
    };
    httpClient.baseUrl =
        'https://api-flutter-developer-zrgju.ondigitalocean.app/';
  }

  Future<List<Questions>> fetchQuestions() async {
    final response = await get(
      'questions?filter[code]=en_CA',
      headers: <String, String>{
        'X-Topic-Key':
            '408c7c5887a0f3905767754f424989b0089c14ac502d7f851d11b31ea2d1baa6',
        'X-Api-Version': '2',
      },
    );
    //print(response.body);
    //print('antes del return');
    return response.body;
  }

  Future<Questions?> getQuestions(int id) async {
    final response = await get('questions/$id');
    return response.body;
  }

  Future<Response<Questions>> postQuestions(Questions questions) async =>
      await post('questions', questions);
  Future<Response> deleteQuestions(int id) async =>
      await delete('questions/$id');
}
