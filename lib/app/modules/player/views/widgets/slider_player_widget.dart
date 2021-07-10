import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_player_liontude/app/modules/player/controllers/player_controller.dart';

class SliderPlayer extends StatelessWidget {
  const SliderPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayerController controller = Get.find();
    return Slider.adaptive(
        activeColor: Color(0xfffcba29),
        inactiveColor: Colors.grey,
        value: controller.position.inSeconds.toDouble(),
        max: controller.audioLength.inSeconds.toDouble(),
        onChanged: (value) {
          controller.seekToSec(value.toInt());
        });
  }
}
