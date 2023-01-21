import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/parallax.dart';

import '../actors/airship.dart';
import '../actors/crow.dart';
import '../scroll_game.dart';

class HomeScreen extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  Timer interval = Timer(6, repeat: true);

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

    add(Crow());
    interval.onTick = () => add(AirShip());
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
