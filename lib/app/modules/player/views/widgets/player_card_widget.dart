import 'package:audio_player_liontude/app/modules/player/controllers/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_player_liontude/app/modules/player/views/widgets/slider_player_widget.dart';

import '../../../../../constants.dart';

class PlayerCardWidget extends StatelessWidget {
  const PlayerCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayerController controller = Get.find();

    return Container(
      child: GetBuilder<PlayerController>(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /*Text(
                'Go Player',
                style: kLabelTextStyleInc,
              ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${controller.position.inMinutes}: ${controller.position.inSeconds.remainder(60)}'),
                SliderPlayer(),
                Text(
                    '${controller.audioLength.inMinutes}: ${controller.audioLength.inSeconds.remainder(60)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_previous),
                  iconSize: 45,
                ),
                IconButton(
                  onPressed: () {
                    controller.actionPlayButton(controller.active.value);
                    /*  if (!controller.playing.isFalse) {
                      controller.cache
                          .play('0a4a1054abdd899ca409e635ad1ea843.mp3');
                    } else {
                      controller.player.pause();
                    }*/
                  },
                  icon: (controller.playing.isTrue)
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow),
                  iconSize: 55,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next),
                  iconSize: 45,
                ),
              ],
            ),
          ],
        ),
      ),
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: kActiveCardColour,
        borderRadius: BorderRadius.circular(10.0),
        /*boxShadow: [
              BoxShadow(
                //color: Color(0xFFFF9E27).withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],*/
      ),
    );
  }
}
