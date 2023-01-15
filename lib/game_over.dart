import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'scroll_game.dart';

class GameOver extends Component with HasGameRef<ScrollGame> {
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
}
