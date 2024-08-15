import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kayıt Ol')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-Posta Adresi'),
            ),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'Ad'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Soyad'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Şifre'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await authController.register(
                    emailController.text,
                    passwordController.text,
                    firstNameController.text,
                    lastNameController.text);
                if (success) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kayıt başarılı!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kayıt başarısız!')),
                  );
                }
              },
              child: Text('Kayıt Ol'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Vazgeç'),
            ),
          ],
        ),
      ),
    );
  }
}
