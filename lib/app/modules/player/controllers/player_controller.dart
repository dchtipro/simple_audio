import 'package:get/get.dart';

import 'package:audio_player_liontude/app/data/models/questions_model.dart';
import 'package:audio_player_liontude/app/data/providers/questions_provider.dart';

class PlayerController extends GetxController {
  var isLoading = false.obs;
  final _questions = <Questions>[].obs;
  List<Questions> get questions => _questions;
  final QuestionsProvider questionsProvider;
  PlayerController(this.questionsProvider);
  @override
  void onInit() {
    print('en InitPlayerCOntroller');
    _getQuestions();
    super.onInit();
  }

  Future<void> _getQuestions() async {
    isLoading.value = true;
    try {
      //print('en el Future');

      //final response = await ApiService().fetchHeadLines();
      final response = await questionsProvider.fetchQuestions();

      _questions.addAll(response);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
