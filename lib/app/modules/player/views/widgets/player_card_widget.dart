import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../../../constants.dart';

class PlayerCardWidget extends StatefulWidget {
  const PlayerCardWidget({Key? key}) : super(key: key);

  @override
  _PlayerCardWidgetState createState() => _PlayerCardWidgetState();
}

class _PlayerCardWidgetState extends State<PlayerCardWidget> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  late AudioPlayer _player;
  late AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Slider.adaptive(
        activeColor: Color(0xfffcba29),
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        });
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player, prefix: 'assets/audios/');
    _player.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      setState(() => musicLength = d);
    });

    _player.onAudioPositionChanged.listen((Duration p) {
      print('Current position: $p');
      setState(() => position = p);
    });
    cache.load('0a4a1054abdd899ca409e635ad1ea843.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                  '${position.inMinutes}: ${position.inSeconds.remainder(60)}'),
              slider(),
              Text(
                  '${musicLength.inMinutes}: ${musicLength.inSeconds.remainder(60)}'),
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
                  if (!playing) {
                    cache.play('0a4a1054abdd899ca409e635ad1ea843.mp3');
                    setState(() {
                      playBtn = Icons.pause;
                      playing = true;
                    });
                  } else {
                    _player.pause();
                    setState(() {
                      playBtn = Icons.play_arrow;
                      playing = false;
                    });
                  }
                },
                icon: Icon(playBtn),
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
