import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/change_password_screen.dart';
import 'screens/new_password_screen.dart';
import 'screens/notes_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/reminders_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/wallpaper_screen.dart';
import 'screens/articles_screen.dart';
import 'screens/goals_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('tr', 'TR'),
        Locale('de', 'DE')
      ],
      path: 'assets/lang', 
      fallbackLocale: Locale('tr', 'TR'), // Varsayılan dil Türkçe
      startLocale: Locale('tr', 'TR'), // Uygulama başlatıldığında gelen varsayılan dil Türkçe
      child: MeditationApp(),
    ),
  );
}

class MeditationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/', // Başlangıç rotası WelcomeScreen olacak
      routes: {
        '/': (context) => ArticlesScreen(), // Ana giriş ekranı
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


