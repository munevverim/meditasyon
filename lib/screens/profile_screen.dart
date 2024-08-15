import 'package:flutter/material.dart';
import '../db_helper.dart';  // DBHelper sınıfını import edin.

class ProfileScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final String userEmail;  // Kullanıcının e-posta adresi

  ProfileScreen({required this.userEmail});  // userEmail constructor'dan alınır

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil Düzenleme')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'Ad'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Soyad'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Kullanıcının profil bilgilerini güncelle
                DBHelper dbHelper = DBHelper();
                int result = await dbHelper.updateUserProfile(userEmail, firstNameController.text, lastNameController.text);

                if (result > 0) {
                  // Güncelleme başarılı olduysa bildirim göster
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Profil başarıyla güncellendi'),
                  ));
                  Navigator.pop(context);  // Kullanıcıyı önceki sayfaya döndür
                } else {
                  // Güncelleme başarısız olduysa hata mesajı göster
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Profil güncellenemedi.'),
                  ));
                }
              },
              child: Text('Değişiklikleri Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
