import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MeditationTile extends StatelessWidget {
  final String title;
  final String duration;
  final String audioPath; // Ses dosyasının yolu
  final Function(String) onTap; // Ekstra fonksiyon

  MeditationTile({
    required this.title,
    required this.duration,
    required this.audioPath,
    required this.onTap,
  });

  void _playAudio() async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(DeviceFileSource(audioPath));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(duration),
      onTap: () {
        _playAudio(); // Ses dosyasını çal
        onTap(title); // Ekstra işlemi gerçekleştir
      },
    );
  }
}
