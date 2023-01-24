import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';

import 'actors/crow.dart';
import 'screens/game_over.dart';
import 'screens/home_screen.dart';
import 'screens/start_screen.dart';

class ScrollGame extends FlameGame
    with HasTappableComponents, HasCollisionDetection {
  late final RouterComponent router;
  bool gameOver = false;
  bool displayingGameOver = false;
  Vector2 velocity = Vector2(0, 30);
  final stopwatch = Stopwatch();
  final Crow crow = Crow();

  @override
  void onLoad() async {
    await super.onLoad();
    FlameAudio.bgm.initialize();

    add(router = RouterComponent(
      routes: {
        'game': Route(HomeScreen.new),
        'gameover': Route(GameOver.new),
        'start': Route(StartScreen.new),
      },
      initialRoute: 'start',
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameOver && !displayingGameOver) {
      router.pushNamed('gameover');
      displayingGameOver = true;
      if (FlameAudio.bgm.isPlaying) {
        FlameAudio.bgm.pause();
      }
    }
  }
}
