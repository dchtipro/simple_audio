import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audio_player_liontude/app/data/models/questions_model.dart';
import 'package:audio_player_liontude/app/data/providers/questions_provider.dart';

class PlayerController extends GetxController {
  var active = 0.obs;
  var playing = false.obs;
  var isLoading = false.obs;

  AudioPlayer player = AudioPlayer();
  AudioCache cache = AudioCache();

  Duration position = new Duration();
  Duration audioLength = new Duration();

  final _questions = <Questions>[].obs;
  final _audios = <Labels>[].obs;

  List<Questions> get questions => _questions;
  List<Labels> get audios => _audios;
  final QuestionsProvider questionsProvider;
  PlayerController(this.questionsProvider);
  @override
  void onInit() {
    print('en InitPlayerCOntroller');
    //_player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player, prefix: 'assets/audios/');
    player.onDurationChanged.listen((Duration d) {
      //print('Max duration: $d');
      audioLength = d;
    });

    player.onAudioPositionChanged.listen((Duration p) {
      //print('Current position: $p');
      position = p;
    });
    _getQuestions();

    super.onInit();
  }

  Future<void> _getQuestions() async {
    isLoading.value = true;
    try {
      //print('en el Future');

      //final response = await ApiService().fetchHeadLines();
      final response = await questionsProvider.fetchQuestions();
      if (response.isNotEmpty) {
        _questions.addAll(response);
        response.forEach((element) {
          _audios.add(element.labels![0]);
        });
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    //print('FUTURE FALSE');
    //print(isLoading.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  actionPlayButton(int index) {
    print('en actionButton');
    print('Playing = ' + playing.value.toString());
    print('Active = ' + active.value.toString());
    active++;

    print(!playing.value);
    if (!playing.isTrue) {
      print('dentro del if');
      cache
          .play(_audios[index].fileName!)
          .whenComplete(() => print('Complete'));
      playing.value = true;
      print('Playing = ' + playing.value.toString());
    } else {
      print('dentro del else');
      player.pause();

      playing.value = false;
      print('Playing = ' + playing.value.toString());
    }
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    player.seek(newPos);
  }
}
