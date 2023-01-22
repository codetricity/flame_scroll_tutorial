import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'gui/buttons.dart';
import 'scroll_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscapeLeftOnly();
  Flame.device.fullScreen();
  FlameGame game = ScrollGame();
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          GameWidget(game: game),
          Buttons(
            game: game,
          ),
        ]),
      ),
    ),
  );
}
