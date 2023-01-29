import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

import '../actors/airship.dart';
import '../gui/elapsed_time.dart';
import '../scroll_game.dart';
import '../world/mountain_background.dart';

class HomeScreen extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  Timer interval = Timer(6, repeat: true);

  @override
  void onLoad() async {
    add(MountainBackground());
    add(
      SpriteComponent(
          sprite: await gameRef.loadSprite('oppkey_logo.png'),
          position: Vector2(gameRef.size.x * .8, gameRef.size.y * .05),
          size: Vector2.all(gameRef.size.y * .2)),
    );
    add(gameRef.crow);
    addShips();
    add(ElapsedTime());
    gameRef.stopwatch.start();
    add(TextComponent(
        text: 'avoid developer frustration - partner with Oppkey',
        anchor: Anchor.bottomCenter,
        position: Vector2(gameRef.size.x / 2, gameRef.size.y * .95),
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 24, color: Colors.pink))));
  }

  void addShips() {
    interval.onTick = () {
      double elapsedSeconds = gameRef.stopwatch.elapsed.inSeconds.toDouble();
      void addShipAtSecond(int secondToAdd) {
        Future.delayed(
            Duration(seconds: secondToAdd), () => add(AirShip(elapsedSeconds)));
      }

      // add first ship
      add(AirShip(elapsedSeconds));
      // add 2 ships each tick after 30 seconds
      if (elapsedSeconds > 30.0) {
        addShipAtSecond(3);
      }
      // add 3 ships each tick after 60 seconds
      if (elapsedSeconds > 60.0) {
        addShipAtSecond(1);
      }
      // add 4th ship each tick cycle
      if (elapsedSeconds > 90.0) {
        addShipAtSecond(4);
      }
      // add fifth ship each tick cycle
      if (elapsedSeconds > 110.0) {
        addShipAtSecond(5);
      }
      // add 6th ship each tick cycle
      if (elapsedSeconds > 130.0) {
        addShipAtSecond(2);
      }
    };
  }

  @override
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.velocity.y -= 20;
    super.onTapUp(event);
  }
}
