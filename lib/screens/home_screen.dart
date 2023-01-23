import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

import '../actors/airship.dart';
import '../actors/crow.dart';
import '../gui/elapsed_time.dart';
import '../scroll_game.dart';
import '../world/mountain_background.dart';

class HomeScreen extends Component with HasGameRef<ScrollGame>, TapCallbacks {
  Timer interval = Timer(6, repeat: true);

  @override
  void onLoad() async {
    add(MountainBackground());
    add(Crow());
    addShips();
    add(ElapsedTime());
    gameRef.stopwatch.start();
  }

  void addShips() {
    interval.onTick = () {
      double elapsedSeconds = gameRef.stopwatch.elapsed.inSeconds.toDouble();
      add(AirShip(elapsedSeconds));
      if (elapsedSeconds > 30.0) {
        Future.delayed(
          const Duration(seconds: 3),
          () => add(
            AirShip(elapsedSeconds),
          ),
        );
      }
      if (elapsedSeconds > 60.0) {
        Future.delayed(
          const Duration(seconds: 1),
          () => add(
            AirShip(elapsedSeconds),
          ),
        );
      }
      if (elapsedSeconds > 90.0) {
        Future.delayed(
          const Duration(seconds: 4),
          () => add(
            AirShip(elapsedSeconds),
          ),
        );
      }
      if (elapsedSeconds > 110.0) {
        Future.delayed(
          const Duration(seconds: 5),
          () => add(
            AirShip(elapsedSeconds),
          ),
        );
      }
    };
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
