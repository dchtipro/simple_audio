import 'package:audio_player_liontude/app/data/providers/questions_provider.dart';
import 'package:get/get.dart';

import '../controllers/player_controller.dart';

class PlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsProvider>(
      () => QuestionsProvider(),
    );

    Get.lazyPut<PlayerController>(
      () => PlayerController(
        Get.find(),
      ),
    );
  }
}
