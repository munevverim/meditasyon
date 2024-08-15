import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/meditation_player.dart';
import 'package:flutter_application_1/screens/meditation_screen.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';

import 'package:flutter_application_1/screens/change_password_screen.dart';
import 'package:flutter_application_1/screens/new_password_screen.dart';
import 'package:flutter_application_1/screens/notes_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/screens/reminders_screen.dart';
import 'package:flutter_application_1/screens/settings_screen.dart';
import 'package:flutter_application_1/screens/todo_screen.dart';
import 'package:flutter_application_1/screens/wallpaper_screen.dart';
import 'package:flutter_application_1/screens/articles_screen.dart';
import 'package:flutter_application_1/screens/goals_screen.dart';


void main() {
  runApp(MeditationApp());
}

class MeditationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Başlangıç rotası
      routes: {
        '/': (context) => RemindersScreen(), // Test ekranı ana giriş ekranı olarak ayarlandı
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        
        '/change-password': (context) => ChangePasswordScreen(),
        '/new-password': (context) => NewPasswordScreen(userEmail: '',),
        '/notes': (context) => NotesScreen(),
        '/profile': (context) => ProfileScreen(userEmail: '',),
        '/reminders': (context) => RemindersScreen(),
        '/settings': (context) => SettingsScreen(),
        
        '/wallpaper': (context) => WallpaperScreen(),
        '/articles': (context) => ArticlesScreen(),
        '/goals': (context) => GoalsScreen(),
        
        
      },
    );
  }
}
