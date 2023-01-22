import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

import '../actors/airship.dart';
import '../actors/crow.dart';
import '../gui/elapsed_time.dart';
import '../scroll_game.dart';

class HomeScreen extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  Timer interval = Timer(6, repeat: true);
  // TextComponent elapsedTime = TextBoxComponent();
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
    gameRef.stopwatch.start();
    add(ElapsedTime());
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.velocity.y -= 20;
    super.onTapUp(event);
  }
}
