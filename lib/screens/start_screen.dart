import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../scroll_game.dart';

class StartScreen extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  @override
  void onLoad() async {
    await super.onLoad();
    add(TextComponent(
        text: 'START',
        anchor: Anchor.center,
        position: gameRef.size / 2,
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 64, color: Colors.green))));
    add(TextBoxComponent(
        boxConfig: TextBoxConfig(maxWidth: gameRef.size.x * .7),
        anchor: Anchor.center,
        position: Vector2(gameRef.size.x / 2, gameRef.size.y * .7),
        text: 'Click on mouse button to keep crow flying. Avoid hitting ships. '
            'Click on Game Over screen to restart game. Close tab to end game. '
            'Click on start to begin play.',
        textRenderer: TextPaint(style: const TextStyle(color: Colors.yellow))));
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    FlameAudio.bgm.play('dramatic_boi.ogg', volume: 0.5);

    gameRef.router.pushNamed('game');

    super.onTapUp(event);
  }
}
