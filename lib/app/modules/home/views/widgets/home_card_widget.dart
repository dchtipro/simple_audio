import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class HomeCard extends StatelessWidget {
  final VoidCallback onPress;
  const HomeCard({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Go Player',
                  //context.read<FinblaViewModel>().balance(),
                  style: kNumberTextStyle,
                ),
              ],
            ),
          ],
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
      ),
    );
  }
}
