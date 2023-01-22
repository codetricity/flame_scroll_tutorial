import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:scroll/world/mountain_background.dart';

import '../actors/airship.dart';
import '../actors/crow.dart';
import '../gui/elapsed_time.dart';
import '../scroll_game.dart';

class HomeScreen extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  Timer interval = Timer(6, repeat: true);
  @override
  void onLoad() async {
    add(MountainBackground());
    add(Crow());
    interval.onTick = () => add(AirShip());
    gameRef.stopwatch.start();
    add(ElapsedTime());
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
