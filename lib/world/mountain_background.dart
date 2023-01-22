import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:scroll/scroll_game.dart';

class MountainBackground extends Component with HasGameRef<ScrollGame> {
  @override
  void onLoad() async {
    await super.onLoad();
    add(
      await gameRef.loadParallaxComponent(
        [
          ParallaxImageData('sky_lightened.png'),
          ParallaxImageData('clouds_bg.png'),
          ParallaxImageData('mountains.png'),
          ParallaxImageData('clouds_mg.png'),
          ParallaxImageData('cloud_lonely.png'),
        ],
        baseVelocity: Vector2(10, 0),
        velocityMultiplierDelta: Vector2(1.6, 1.0),
      ),
    );
  }
}
