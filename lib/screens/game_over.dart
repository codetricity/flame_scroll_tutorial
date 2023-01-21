import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../scroll_game.dart';

class GameOver extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  @override
  void onLoad() async {
    super.onLoad();
    FlameAudio.bgm.pause();

    add(TextComponent(
        text: 'GAME OVER',
        anchor: Anchor.center,
        position: gameRef.size / 2,
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 64, color: Colors.red))));
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
    gameRef.router.pop();

    super.onTapUp(event);
  }
}
