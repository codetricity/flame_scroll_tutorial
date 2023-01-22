import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  final FlameGame game;
  const Buttons({Key? key, required this.game}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool musicIsPlaying = true;
  bool gameIsPaused = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              if (FlameAudio.bgm.isPlaying) {
                FlameAudio.bgm.pause();
                setState(() {
                  musicIsPlaying = false;
                });
              } else {
                FlameAudio.bgm.resume();
                setState(() {
                  musicIsPlaying = true;
                });
              }
            },
            icon: Icon(musicIsPlaying ? Icons.volume_up : Icons.volume_off)),
        IconButton(
            onPressed: () {
              if (widget.game.paused) {
                widget.game.paused = false;
                FlameAudio.bgm.resume();
                setState(() {
                  musicIsPlaying = true;
                  gameIsPaused = false;
                });
              } else {
                widget.game.paused = true;
                FlameAudio.bgm.pause();
                setState(() {
                  musicIsPlaying = false;
                  gameIsPaused = true;
                });
              }
            },
            icon: Icon(gameIsPaused ? Icons.play_arrow : Icons.pause))
      ],
    );
  }
}
