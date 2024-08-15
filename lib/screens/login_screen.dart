import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Giriş Yap')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-Posta Adresi'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Şifre'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await authController.login(emailController.text, passwordController.text);
                if (success) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Giriş başarısız!')),
                  );
                }
              },
              child: Text('Giriş Yap'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: Text('Hesabın yok mu? Kayıt Ol'),
            ),
          ],
        ),
      ),
    );
  }
}
