import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_1/screens/meditation_player.dart';

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<String> meditationTitles = ['Nötr', 'Feel Good', 'Goals', 'Calm', 'Healing', 'Protect', 'Blockage'];
  final List<String> meditationPaths = [
    'assets/audios/meditasyon_sesi1.mp3',
    'assets/audios/meditasyon_sesi2.mp3',
    'assets/audios/meditasyon_sesi3.mp3',
    'assets/audios/meditasyon_sesi4.mp3',
    'assets/audios/meditasyon_sesi5.mp3',
    'assets/audios/meditasyon_sesi6.mp3',
    'assets/audios/meditasyon_sesi7.mp3'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _navigateToPlayer(String title, String audioPath) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeditationPlayerScreen(title: title, audioPath: audioPath)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color meditationColor = Color(0xFFE69483);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meditasyonlar', style: TextStyle(color: meditationColor)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: meditationColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: meditationColor,
          tabs: [
            Tab(text: 'Meditasyon'),
            Tab(text: 'Sesli Meditasyon'),
            Tab(text: 'Buz Element'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MeditationList(onTileTap: _navigateToPlayer, titles: meditationTitles, audioPaths: meditationPaths),
          MeditationList(onTileTap: _navigateToPlayer, titles: meditationTitles, audioPaths: meditationPaths),
          MeditationList(onTileTap: _navigateToPlayer, titles: meditationTitles, audioPaths: meditationPaths),
        ],
      ),
    );
  }
}

class MeditationList extends StatelessWidget {
  final Function(String, String) onTileTap;
  final List<String> titles;
  final List<String> audioPaths;

  MeditationList({required this.onTileTap, required this.titles, required this.audioPaths});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(titles[index]),
          trailing: IconButton(
            icon: Icon(Icons.play_arrow, color: Colors.black),
            onPressed: () => onTileTap(titles[index], audioPaths[index]),
          ),
        );
      },
    );
  }
}
