import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

import 'scroll_game.dart';

class HomeScreen extends Component with HasGameRef<ScrollGame> {
  late SpriteAnimationComponent crow;
  void onLoad() async {
    ParallaxComponent seaBackground = await gameRef.loadParallaxComponent([
      ParallaxImageData('sky_lightened.png'),
      ParallaxImageData('clouds_bg.png'),
      ParallaxImageData('mountains.png'),
      ParallaxImageData('clouds_mg.png'),
      ParallaxImageData('cloud_lonely.png'),
    ],
        baseVelocity: Vector2(10, 0),
        velocityMultiplierDelta: Vector2(1.6, 1.0));
    add(seaBackground);

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
    if (crow.y < gameRef.size.y) {
      gameRef.velocity.y += .4;
      crow.position += gameRef.velocity * dt;
    } else {
      gameRef.gameOver = true;
    }
  }
}
