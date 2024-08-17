import '../db_helper.dart';

class AuthController {
  final DBHelper dbHelper = DBHelper();

  // Kullanıcı kaydı
  Future<String> register(String email, String password, String firstName, String lastName) async {
    // Kullanıcıyı kaydetmeden önce e-posta kontrolü
    bool userExists = await dbHelper.checkUserExists(email);
    if (userExists) {
      return 'Bu e-posta adresiyle kayıtlı bir kullanıcı zaten var.';
    }

    Map<String, dynamic> user = {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
    };
    int result = await dbHelper.registerUser(user);
    if (result != -1) {
      return 'success'; // Kayıt başarılı
    } else {
      return 'Kayıt başarısız, lütfen tekrar deneyin.'; // Kayıt başarısız
    }
  }

  // Kullanıcı girişi
  Future<String> login(String email, String password) async {
    bool userExists = await dbHelper.checkUserExists(email);
    if (!userExists) {
      return 'Bu e-posta adresiyle kayıtlı bir kullanıcı bulunamadı.';
    }

    bool success = await dbHelper.loginUser(email, password);
    if (success) {
      return 'success'; // Giriş başarılı
    } else {
      return 'Hatalı şifre, lütfen tekrar deneyin.'; // Şifre hatalı
    }
  }

  // Kullanıcı çıkışı
  Future<void> logout() async {
    await dbHelper.logoutUser();
  }
}
