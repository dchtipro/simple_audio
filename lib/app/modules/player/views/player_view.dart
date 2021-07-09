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
            flex: 2,
            child: PlayerCardWidget(),
          ),
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    color: kActiveCardColour),
                child: ListView.separated(
                    itemBuilder: (context, index) => Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Item1',
                                style: kBodyTextStyle.copyWith(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: 5),
              ))
        ],
      ),
    );
  }
}