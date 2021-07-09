import 'package:get/get.dart';

import 'package:audio_player_liontude/app/modules/home/bindings/home_binding.dart';
import 'package:audio_player_liontude/app/modules/home/views/home_view.dart';
import 'package:audio_player_liontude/app/modules/player/bindings/player_binding.dart';
import 'package:audio_player_liontude/app/modules/player/views/player_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PLAYER,
      page: () => PlayerView(),
      binding: PlayerBinding(),
    ),
  ];
}
