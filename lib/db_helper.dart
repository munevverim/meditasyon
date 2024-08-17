import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    // Reminders table
    await db.execute('''
      CREATE TABLE reminders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        date TEXT,
        time TEXT
      )
    ''');

    // Goals table
    await db.execute('''
      CREATE TABLE goals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT
      )
    ''');

    // Users table for authentication
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name TEXT,
        last_name TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');

    // Session table to store logged in user
    await db.execute('''
      CREATE TABLE session (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        FOREIGN KEY(user_id) REFERENCES users(id)
      )
    ''');
  }

  // Kullanıcının mevcut olup olmadığını kontrol eden fonksiyon
  Future<bool> checkUserExists(String email) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return results.isNotEmpty; // Kullanıcı varsa true döndür
  }

  // Reminder functions
  Future<int> insertReminder(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('reminders', row);
  }

  Future<List<Map<String, dynamic>>> queryAllReminders() async {
    Database db = await database;
    return await db.query('reminders');
  }

  Future<int> updateReminder(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('reminders', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteReminder(int id) async {
    Database db = await database;
    return await db.delete('reminders', where: 'id = ?', whereArgs: [id]);
  }

  // Goal functions
  Future<int> insertGoal(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('goals', row);
  }

  Future<List<Map<String, dynamic>>> queryAllGoals() async {
    Database db = await database;
    return await db.query('goals');
  }

  Future<int> updateGoal(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('goals', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteGoal(int id) async {
    Database db = await database;
    return await db.delete('goals', where: 'id = ?', whereArgs: [id]);
  }

  // User authentication functions

  // Register a new user
  Future<int> registerUser(Map<String, dynamic> user) async {
    Database db = await database;
    try {
      return await db.insert('users', user);
    } catch (e) {
      print("Error: $e");
      return -1; // Return -1 to indicate error (e.g., email already exists)
    }
  }

  // Login function to validate user credentials and create session
  Future<bool> loginUser(String email, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      // Create a session for the logged in user
      int userId = results.first['id'];
      await db.insert('session', {'user_id': userId});
      return true;
    }
    return false; // User not found
  }

  // Check if there is a logged in user
  Future<int?> getCurrentUserId() async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query('session');
    if (results.isNotEmpty) {
      return results.first['user_id'];
    }
    return null; // No user is logged in
  }

  // Logout function to delete the current session
  Future<void> logoutUser() async {
    Database db = await database;
    await db.delete('session');
  }

  // Update password
  Future<int> updatePassword(String email, String newPassword) async {
    Database db = await database;
    return await db.update(
      'users',
      {'password': newPassword},
      where: 'email = ?',
      whereArgs: [email],
    );
  }

  // Update user profile
  Future<int> updateUserProfile(String email, String firstName, String lastName) async {
    Database db = await database;
    return await db.update(
      'users',
      {'first_name': firstName, 'last_name': lastName},
      where: 'email = ?',
      whereArgs: [email],
    );
  }
}
