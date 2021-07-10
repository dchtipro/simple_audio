import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audio_player_liontude/app/data/models/questions_model.dart';
import 'package:audio_player_liontude/app/data/providers/questions_provider.dart';

class PlayerController extends GetxController {
  var active = 0.obs;
  var playing = false.obs;
  var idle = false.obs;
  var isLoading = false.obs;

  AudioPlayer player = AudioPlayer();
  var cache = AudioCache().obs;

  var position = new Duration().obs;
  var audioLength = new Duration().obs;

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
    cache.value = AudioCache(fixedPlayer: player, prefix: 'assets/audios/');
    //cache.value.loadAll(_audios);
    cache.value.fixedPlayer!.onDurationChanged.listen((Duration d) {
      //print('Max duration: $d');
      audioLength.value = d;
    });

    cache.value.fixedPlayer!.onAudioPositionChanged.listen((Duration p) {
      //print('Current position: $p');
      position.value = p;
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

    print(!playing.value);
    if (!playing.value) {
      print('dentro del if');
      active.value = index;
      if (!idle.value) {
        idle.value = true;
        playAudio(active.value);
        if (active.value < _audios.length) {
          active.value++;
        } else {
          active.value = 0;
        }
      }

      //cache.value.play(_audios[active.value].fileName!);

      //cache.value.play(_audios[index].fileName!);

      playing.value = true;
      //idle.value = true;

      print('Playing = ' + playing.value.toString());
      print('Active = ' + active.value.toString());
    } else {
      playing.value = false;
      idle.value = false;
      //idle.value = false;
      cache.value.fixedPlayer!.pause();
      print('Playing = ' + playing.value.toString());
    }
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    cache.value.fixedPlayer!.seek(newPos);
  }

  Future<void> playAudio(int index) async {
    await cache.value.play(_audios[active.value].fileName!, stayAwake: true);
    AudioServiceBackground.sendCustomEvent({'PLAY_EVENT': true});
    await cache.value.fixedPlayer!.onPlayerCompletion.listen((event) {
      print('onPlayerCompletion');
      AudioServiceBackground.sendCustomEvent({'COMPLETE_EVENT': true});
      if (idle.value) {
        print('en Idle');
        print(active.value);
        playAudio(active.value);
        if (active.value < _audios.length) {
          active.value++;
        } else {
          active.value = 0;
        }
      }
    });
  }
}
