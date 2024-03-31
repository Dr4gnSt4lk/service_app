import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static String customer = '';
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE products(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      description TEXT,
      price INTEGER,
      discount INTEGER,
      inStock TEXT,
      tags TEXT,
      rating REAL,
      image BLOB,
      discountTime TEXT
    )""");

        await database.execute("""CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      password TEXT,
      email TEXT
    )""");
    
    
  }

    static Future<sql.Database> db() async {
    return sql.openDatabase(
      'shop.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        print("Создание таблиц");
        await createTables(database);
      },
    );
  }

    static Future<int> createItem(
      String title,
      String? description,
      int? price,
      int? discount,
      String? inStock,
      String? tags,
      double? rating,
      Uint8List? image,
      String? discountTime) async {
    final db = await SQLHelper.db();
  DateTime currentTime = DateTime.now();
  DateTime discountExpiration = currentTime.add(Duration(hours: 24));

  String formattedDiscountTime = discountExpiration.toIso8601String(); // пусть пока на все товары скидка 24 часа будет
    final data = {
      'title': title,
      'description': description,
      'price': price,
      'discount': discount,
      'inStock': inStock,
      'tags': tags,
      'rating': rating,
      'image': image,
      'discountTime': formattedDiscountTime
    };

    final id = await db.insert('products', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('products', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('products', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id,
      String title,
      String? description,
      int? price,
      int? discount,
      String? inStock,
      String? tags,
      double? rating,
      Uint8List? image) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': description,
      'price': price,
      'discount': discount,
      'inStock': inStock,
      'tags': tags,
      'rating': rating,
      'image': image
    };

    final result =
        await db.update('products', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("products", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Не получилось удалить товар: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> searchByName(String title) async {
    final db = await SQLHelper.db();
    return await db
        .query('products', where: 'title LIKE ?', whereArgs: ['%$title%']);
  }

  //регистрация
  static Future<void> registerUser(String name, String password, String email) async {
    final db = await SQLHelper.db();
    
    // Проверяем, существует ли пользователь с таким email
    List<Map<String, dynamic>> existingUsers = await db.query('users', where: 'email = ?', whereArgs: [email]);

    if (existingUsers.isNotEmpty) {
      // Пользователь с таким email уже существует
      print('Пользователь с таким email уже существует');
      return;
    }

    // Вставляем нового пользователя
    await db.insert('users', {
      'name': name,
      'password': password,
      'email': email,
    });
    //await SQLHelper.registerUser('Имя', 'Пароль', 'email@example.com'); - пример использования

  }
//регистрация через гугл
  static Future<void> registerUserGoogle(String name, String password, String email) async {
  final db = await SQLHelper.db();

  // Регистрация пользователя через Google
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if (googleUser == null) {
    // Пользователь отменил вход через Google
    print('Вход через Google отменен');
    return;
  }

  // Дополнительная информация о пользователе
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  String googleIdToken = googleAuth.idToken ?? "";

  // Получаем реальный адрес электронной почты пользователя
  String userEmail = googleUser.email;

  // Проверяем, существует ли пользователь с таким email
  List<Map<String, dynamic>> existingUsers = await db.query('users', where: 'email = ?', whereArgs: [userEmail]);

  if (existingUsers.isNotEmpty) {
    // Пользователь с таким email уже существует
    print('Пользователь с таким email уже существует');
    return;
  }

  // Вставляем нового пользователя
  await db.insert('users', {
    'name': name,
    'password': googleIdToken,
    'email': userEmail,
  });

  print('Пользователь успешно зарегистрирован через Google');
}

  static Future<bool> authenticateUser(String email, String password) async {
    final db = await SQLHelper.db();

    // Проверяем, существует ли пользователь с заданным email и паролем
    List<Map<String, dynamic>> user = await db.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (user.isNotEmpty) {
      // Пользователь успешно аутентифицирован
      customer = user[0]['name']; // Сохраняем имя пользователя в customer
      return true;
    } else {
      // Пользователь с заданным email и паролем не найден
      return false;
    }

    /** Пример использования
     * bool isAuthenticated = await SQLHelper.authenticateUser('email@example.com', 'password');

if (isAuthenticated) {
  print('Пользователь успешно авторизован. Имя пользователя: ${SQLHelper.customer}');
} else {
  print('Неверный email или пароль');
}

     */
  }
 // авторизация через гугл
  static Future<void> loginUserGoogle() async {
  final db = await SQLHelper.db();

  try {
    // Попытка входа через Google
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      // Пользователь отменил вход через Google
      print('Вход через Google отменен');
      return;
    }

    // Дополнительная информация о пользователе
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    String googleIdToken = googleAuth.idToken ?? "";

    // Проверяем, существует ли пользователь с таким googleIdToken
    List<Map<String, dynamic>> existingUsers =
        await db.query('users', where: 'password = "$googleIdToken"');

    if (existingUsers.isNotEmpty) {
      // Пользователь с таким googleIdToken уже существует
      print('Пользователь с таким googleIdToken уже существует');
      return;
    }

    // Вход пользователя в ваше приложение. Здесь может потребоваться дополнительная логика.

    print('Пользователь успешно вошел через Google');
  } catch (error) {
    print('Ошибка входа через Google: $error');
  }
}
}