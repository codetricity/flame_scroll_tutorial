import 'package:flame/components.dart';

import '../scroll_game.dart';
import 'crow_hitbox.dart';

class Crow extends SpriteAnimationComponent with HasGameRef<ScrollGame> {
  @override
  void onLoad() async {
    await super.onLoad();
    final crowAnimation = await gameRef.loadSpriteAnimation(
        'crow_350x400.webp',
        SpriteAnimationData.sequenced(
            amount: 12,
            amountPerRow: 4,
            stepTime: 0.1,
            textureSize: Vector2(350, 400)));

    anchor = Anchor.center;
    position = Vector2(gameRef.size.x / 2, gameRef.size.y * .6);
    animation = crowAnimation;
    size = Vector2(gameRef.size.y * 350 / 400, gameRef.size.y) * .5;
    add(CrowHitBox()
      ..anchor = Anchor.center
      ..position = size / 2
      ..size = Vector2(size.x * .7, size.y / 2.7));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (y < gameRef.size.y && y > 0 && !gameRef.gameOver) {
      gameRef.velocity.y += .4;
      position += gameRef.velocity * dt;
    } else {
      position = Vector2(gameRef.size.x / 2, gameRef.size.y * .2);
      gameRef.velocity = Vector2(0, 30);
      gameRef.gameOver = true;
    }
  }
}
