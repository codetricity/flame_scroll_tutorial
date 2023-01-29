import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../scroll_game.dart';

class GameOver extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  TextComponent gameOverMessage = TextComponent(
      anchor: Anchor.center,
      textRenderer:
          TextPaint(style: const TextStyle(fontSize: 64, color: Colors.red)));
  TextComponent highScoreComponent = TextComponent(
      anchor: Anchor.center,
      textRenderer: TextPaint(
          style: const TextStyle(fontSize: 24, color: Colors.yellow)));
  @override
  void onLoad() async {
    super.onLoad();
    FlameAudio.bgm.pause();
    gameOverMessage.position = gameRef.size / 2;

    add(gameOverMessage
      ..position = Vector2(gameRef.size.x / 2, gameRef.size.y * .3));
    add(highScoreComponent
      ..position = Vector2(gameRef.size.x / 2, gameRef.size.y * .5));
  }

  @override
  void update(double dt) {
    if (gameRef.displayingGameOver) {
      if (gameRef.stopwatch.isRunning) {
        gameRef.stopwatch.stop();
      }
    }

    var elapsedSeconds = gameRef.stopwatch.elapsed.inSeconds;
    if (elapsedSeconds > gameRef.highScore) {
      gameRef.highScore = elapsedSeconds;
    }

    gameOverMessage.text = 'GAME OVER $elapsedSeconds s';
    highScoreComponent.text = 'HIGH SCORE: ${gameRef.highScore}';
    super.update(dt);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    print('tapped');
    gameRef.displayingGameOver = false;
    gameRef.gameOver = false;
    if (!FlameAudio.bgm.isPlaying) {
      FlameAudio.bgm.resume();
    }
    gameRef.router.pushNamed('game');
    gameRef.stopwatch.reset();
    gameRef.stopwatch.start();

    super.onTapUp(event);
  }
}
