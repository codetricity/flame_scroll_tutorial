import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscapeLeftOnly();
  Flame.device.fullScreen();
  runApp(GameWidget(game: ScrollGame()));
}

class ScrollGame extends FlameGame with TapDetector {
  @override
  void onLoad() async {
    ParallaxComponent seaBackground = await loadParallaxComponent([
      ParallaxImageData('sky_lightened.png'),
      ParallaxImageData('clouds_bg.png'),
      ParallaxImageData('mountains.png'),
      ParallaxImageData('clouds_mg.png'),
      ParallaxImageData('cloud_lonely.png'),
    ],
        baseVelocity: Vector2(10, 0),
        velocityMultiplierDelta: Vector2(1.6, 1.0));
    add(seaBackground);

    final crowAnimation = await loadSpriteAnimation(
        'crow_350x400.webp',
        SpriteAnimationData.sequenced(
            amount: 12,
            amountPerRow: 4,
            stepTime: 0.1,
            textureSize: Vector2(350, 400)));

    add(
      SpriteAnimationComponent(
          anchor: Anchor.center,
          position: Vector2(size.x / 2, size.y * .6),
          animation: crowAnimation,
          size: Vector2(size.y * 350 / 400, size.y)
          // sprite:
          //     await loadSprite('crow_350x400.webp', srcSize: Vector2(350, 400)),
          ),
    );

    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('dramatic_boi.ogg');
  }

  @override
  void onTap() {
    if (FlameAudio.bgm.isPlaying) {
      FlameAudio.bgm.pause();
    } else {
      FlameAudio.bgm.resume();
    }
    super.onTap();
  }
}
