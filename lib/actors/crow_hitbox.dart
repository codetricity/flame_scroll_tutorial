import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class CrowHitBox extends PositionComponent {
  @override
  void onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
    debugMode = true;
  }
}
