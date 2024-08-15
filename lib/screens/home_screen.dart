import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'meditation_screen.dart';
import 'notes_screen.dart';
import 'goals_screen.dart';
import 'todo_screen.dart';
import 'wallpaper_screen.dart';
import 'articles_screen.dart';
import 'reminders_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anasayfa'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildHomeCard(
              context,
              'Meditasyonlar',
              MeditationScreen(),
              FontAwesome5Solid.leaf, // Alternatif simge
            ),
            _buildHomeCard(
              context,
              'Notlar/Olumlamalar',
              NotesScreen(),
              FontAwesome5Solid.sticky_note,
            ),
            _buildHomeCard(
              context,
              'Hatırlatmalar',
              RemindersScreen(),
              FontAwesome5Solid.bell,
            ),
           
            _buildHomeCard(
              context,
              'Hedefler',
              GoalsScreen(),
              FontAwesome5Solid.flag,
            ),
            _buildHomeCard(
              context,
              'Yazılar Köşesi',
              ArticlesScreen(),
              FontAwesome5Solid.newspaper,
            ),
            _buildHomeCard(
              context,
              'Duvar Kağıtları',
              WallpaperScreen(),
              FontAwesome5Solid.image,
            ),
            _buildHomeCard(
              context,
              'İstatistikler',
              SettingsScreen(),
              FontAwesome5Solid.chart_bar,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeCard(BuildContext context, String title, Widget screen, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(icon, size: 30.0, color: Color(0xFFE69483)),
                SizedBox(width: 16.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE69483),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
