import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/parallax.dart';

import 'scroll_game.dart';

class HomeScreen extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  late SpriteAnimationComponent crow;
  Vector2 velocity = Vector2(0, 30);

  @override
  void onLoad() async {
    ParallaxComponent mountainBackground = await gameRef.loadParallaxComponent([
      ParallaxImageData('sky_lightened.png'),
      ParallaxImageData('clouds_bg.png'),
      ParallaxImageData('mountains.png'),
      ParallaxImageData('clouds_mg.png'),
      ParallaxImageData('cloud_lonely.png'),
    ],
        baseVelocity: Vector2(10, 0),
        velocityMultiplierDelta: Vector2(1.6, 1.0));
    add(mountainBackground);

    final crowAnimation = await gameRef.loadSpriteAnimation(
        'crow_350x400.webp',
        SpriteAnimationData.sequenced(
            amount: 12,
            amountPerRow: 4,
            stepTime: 0.1,
            textureSize: Vector2(350, 400)));

    crow = SpriteAnimationComponent(
        anchor: Anchor.center,
        position: Vector2(gameRef.size.x / 2, gameRef.size.y * .6),
        animation: crowAnimation,
        size: Vector2(gameRef.size.y * 350 / 400, gameRef.size.y));
    add(crow);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (crow.y < gameRef.size.y && crow.y > 0 && !gameRef.gameOver) {
      velocity.y += .4;
      crow.position += velocity * dt;
    } else {
      crow.position = Vector2(gameRef.size.x / 2, gameRef.size.y * .2);
      velocity = Vector2(0, 30);
      gameRef.gameOver = true;
    }
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    velocity.y -= 20;
    super.onTapUp(event);
  }
}
