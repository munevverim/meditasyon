import 'package:flutter/material.dart';
import 'package:flutter_application_1/db_helper.dart';
import 'profile_screen.dart';
import 'change_password_screen.dart';
import 'login_screen.dart';
import '../controllers/auth_controller.dart';


class SettingsScreen extends StatelessWidget {
  final DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ayarlar')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Profil Düzenleme'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(userEmail: '')));
            },
          ),
          ListTile(
            title: Text('Şifre Değiştirme'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
            },
          ),
          ListTile(
            title: Text('Gizlilik Sözleşmesi'),
            onTap: () {
              // Gizlilik sözleşmesi ekranına gitme
            },
          ),
          ListTile(
            title: Text('Kullanıcı Sözleşmesi'),
            onTap: () {
              // Kullanıcı sözleşmesi ekranına gitme
            },
          ),
          ListTile(
            title: Text('Çıkış Yap'),
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Çıkış Yap'),
          content: Text('Oturumunuzu kapatmak istediğinizden emin misiniz?'),
          actions: [
            TextButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapat
              },
            ),
            TextButton(
              child: Text('Çıkış Yap'),
              onPressed: () async {
                // Çıkış yapma işlemi
                await dbHelper.logoutUser();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
