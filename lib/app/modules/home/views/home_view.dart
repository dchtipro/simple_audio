import 'package:audio_player_liontude/app/modules/home/views/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 550,
          ),
          Expanded(
            //flex: 1,
            child: HomeCard(onPress: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayerView()),
              );
              print('onPress Home');*/
            }),
          ),
        ],
      ),
    );
  }
}
