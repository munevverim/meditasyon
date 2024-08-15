import 'package:flutter/material.dart';
import '../db_helper.dart';  // DBHelper sınıfını import etmeyi unutmayın.

class NewPasswordScreen extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final String userEmail;  // Kullanıcının e-posta adresi

  NewPasswordScreen({required this.userEmail});  // userEmail'i constructor'da alıyoruz

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yeni Şifre Oluştur')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(labelText: 'Yeni Şifre'),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: 'Yeni Şifre Onayı'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Şifrelerin eşleşip eşleşmediğini ve kriterlere uygun olup olmadığını kontrol edin
                if (newPasswordController.text == confirmPasswordController.text) {
                  if (newPasswordController.text.length >= 6 &&
                      newPasswordController.text.contains(RegExp(r'[0-9]')) &&
                      newPasswordController.text.contains(RegExp(r'[A-Za-z]'))) {
                    
                    // DBHelper'ı kullanarak şifreyi güncelleyin
                    DBHelper dbHelper = DBHelper();
                    int result = await dbHelper.updatePassword(userEmail, newPasswordController.text);
                    
                    if (result > 0) {
                      // Şifre başarıyla güncellendiğinde kullanıcıya bildirin
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Şifre başarıyla değiştirildi'),
                      ));
                      Navigator.pop(context);
                    } else {
                      // Şifre güncellenemezse kullanıcıya bildirin
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Şifre güncellenemedi.'),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Şifre en az 6 karakter uzunluğunda olmalı, bir harf ve bir rakam içermelidir.'),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Şifreler eşleşmiyor.'),
                  ));
                }
              },
              child: Text('Yeni Şifre Oluştur'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Vazgeç'),
            ),
          ],
        ),
      ),
    );
  }
}
