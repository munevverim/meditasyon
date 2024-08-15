import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MeditationList extends StatelessWidget {
  final List<String> meditationTracks;
  final AssetsAudioPlayer audioPlayer;

  MeditationList({required this.meditationTracks, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meditationTracks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Meditasyon Sesi ${index + 1}'),
          onTap: () {
            audioPlayer.open(
              Audio(meditationTracks[index]),
              autoStart: true,
            );
          },
        );
      },
    );
  }
}
