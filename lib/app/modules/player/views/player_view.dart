import 'package:audio_player_liontude/app/modules/player/views/widgets/player_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../controllers/player_controller.dart';

class PlayerView extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlayerView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Center(child: Text('Simple Audio Player Liontude'))),
          Expanded(
            flex: 1,
            child: PlayerCardWidget(),
          ),
          Expanded(
            flex: 3,
            child: Container(
                margin: EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    color: kActiveCardColour),
                child: Obx(() => controller.isLoading.isTrue
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          controller.cache.value
                              .load(controller.audios[index].fileName!);
                          //print(controller.active.value);
                          //print('en la Vista');
                          return ListTile(
                            onTap: () {
                              controller.active.value = index;
                              controller
                                  .actionPlayButton(controller.active.value);
                            },
                            title: Text(
                              controller.audios[index].text!,
                              style: TextStyle(
                                  color: (controller.active == index)
                                      ? Colors.red
                                      : Colors.white),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: controller.audios.length))),
          ),
        ],
      ),
    );
  }
}
