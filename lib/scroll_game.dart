import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';

import 'game_over.dart';
import 'home_screen.dart';

class ScrollGame extends FlameGame
    with HasTappableComponents, HasCollisionDetection {
  late final RouterComponent router;
  bool gameOver = false;
  bool displayingGameOver = false;
  Vector2 velocity = Vector2(0, 30);

  @override
  void onLoad() async {
    add(router = RouterComponent(
      routes: {
        'home': Route(HomeScreen.new),
        'gameover': Route(GameOver.new),
      },
      initialRoute: 'home',
    ));
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('dramatic_boi.ogg', volume: 0.5);
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
