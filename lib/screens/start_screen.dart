import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../scroll_game.dart';

class StartScreen extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  TextBoxComponent instructions = TextBoxComponent();
  TextBoxComponent oppkeyDescription = TextBoxComponent();

  @override
  void onLoad() async {
    await super.onLoad();
    bool smallSize = gameRef.size.y < 820;

    oppkeyDescription = TextBoxComponent(
      boxConfig: TextBoxConfig(maxWidth: gameRef.size.x * .7),
      anchor: Anchor.topCenter,
      position: Vector2(gameRef.size.x / 2, gameRef.size.y * .01),
      text: 'Oppkey helps your organization avoid  developer frustration '
          'with quality documentation, testing, user groups, and blogging. '
          'We make it fun to use your API.',
    );
    oppkeyDescription.textRenderer = smallSize
        ? TextPaint(style: const TextStyle(color: Colors.white, fontSize: 12))
        : TextPaint(style: const TextStyle(color: Colors.grey, fontSize: 24));
    add(oppkeyDescription);
    add(
      SpriteComponent(
          sprite: await gameRef.loadSprite('oppkey_logo.png'),
          anchor: Anchor.center,
          position: Vector2(gameRef.size.x / 2, gameRef.size.y * .3),
          size: Vector2.all(gameRef.size.y * .2)),
    );
    add(TextComponent(
        text: 'START',
        anchor: Anchor.center,
        position: gameRef.size / 2,
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 64, color: Colors.green))));

    instructions = TextBoxComponent(
        boxConfig: TextBoxConfig(maxWidth: gameRef.size.x * .7),
        anchor: Anchor.center,
        position: Vector2(gameRef.size.x / 2, gameRef.size.y * .7),
        text:
            'Click on mouse button to keep Jesse, president of Oppkey, flying. Avoid hitting frustrated '
            'developers. '
            'Click on Game Over screen to restart game. Close tab to end game. '
            'Click on start to begin play.',
        textRenderer: TextPaint(style: const TextStyle(color: Colors.yellow)));
    add(instructions);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    instructions.position = Vector2(gameRef.size.x / 2, gameRef.size.y * .7);

    if (size.y < 820) {
      oppkeyDescription.textRenderer =
          TextPaint(style: const TextStyle(color: Colors.white, fontSize: 12));
    } else {
      oppkeyDescription.textRenderer =
          TextPaint(style: const TextStyle(color: Colors.grey, fontSize: 24));
    }
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
