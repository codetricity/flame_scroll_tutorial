import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../scroll_game.dart';

class AirShip extends SpriteComponent with HasGameRef<ScrollGame> {
  AirShip() : super() {
    debugMode = true;
  }

  Vector2 shipVelocity = Vector2(30, 0);
  final _random = Random();

  @override
  void onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('airship.png');
    size = Vector2(gameRef.size.y * 400 / 235, gameRef.size.y) * .10;
    anchor = Anchor.center;
    double yPosition = _random.nextDouble() * gameRef.size.y;

    position = Vector2(gameRef.size.x, yPosition);
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    position = position - shipVelocity * dt;
    if (position.x < 0) {
      removeFromParent();
    }
    super.update(dt);
  }
}
