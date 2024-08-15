import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Şifre Değiştir')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: oldPasswordController,
              decoration: InputDecoration(labelText: 'Eski Şifre'),
              obscureText: true,
            ),
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
              onPressed: () {
                // Implement password change logic
              },
              child: Text('Şifre Değiştir'),
            ),
          ],
        ),
      ),
    );
  }
}
