import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';

import 'game_over.dart';
import 'home_screen.dart';

class ScrollGame extends FlameGame with TapDetector {
  late final RouterComponent router;
  Vector2 velocity = Vector2(0, 30);
  bool gameOver = false;
  bool displayingGameOver = false;

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
    FlameAudio.bgm.play('dramatic_boi.ogg');
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameOver && !displayingGameOver) {
      router.pushNamed('gameover');
      displayingGameOver = true;
    }
  }

  @override
  void onTapUp(TapUpInfo info) {
    super.onTapUp(info);
    velocity.y -= 20;
  }
}
