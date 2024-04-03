import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:io';
import 'dart:typed_data';

class SQLHelper {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static String customer = '';
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users (
user_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
login VARCHAR(255),
password VARCHAR(255),
email VARCHAR(255),
phone_number INTEGER,
role VARCHAR(255),
image BLOB,
city VARCHAR(255)
)""");

    await database.execute("""CREATE TABLE clients (
user_id INTEGER REFERENCES users(user_id),
client_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
user_name VARCHAR(255),
picture BLOB,
address VARCHAR(255)
)""");

    await database.execute("""CREATE TABLE favorite_sellers (
client_id INTEGER REFERENCES clients(client_id),
seller_id INTEGER REFERENCES sellers(seller_id),
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
)""");

    await database.execute("""CREATE TABLE tickets (
client_id INTEGER REFERENCES clients(client_id),
seller_id INTEGER REFERENCES sellers(seller_id),
offer_id INTEGER REFERENCES offers(offer_id),
ticket_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
status BOOL,
to_pay FLOAT,
feedback VARCHAR(255),
date_purchase DATE
)""");

    await database.execute("""CREATE TABLE sellers (
user_id INTEGER REFERENCES users(user_id),
seller_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
passport BLOB,
seller_name VARCHAR(255),
main_picture BLOB,
description VARCHAR(255),
pictures ARRAY[BLOB],
rating INTEGER,
category VARCHAR(255),
price NUMERIC
)""");

    await database.execute("""CREATE TABLE offers (
seller_id INTEGER REFERENCES sellers(seller_id),
offer_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
percent FLOAT,
date_offer DATE
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

  static Future<void> addSeller(
      int userId,
      int sellerId,
      Uint8List passport,
      String sellerName,
      Uint8List mainPicture,
      String description,
      List<Uint8List> pictures,
      int rating,
      String category,
      num price) async {
    final db = await SQLHelper.db();
    await db.insert('sellers', {
      'user_id': userId,
      'seller_id': sellerId,
      'passport': passport,
      'seller_name': sellerName,
      'main_picture': mainPicture,
      'description': description,
      'pictures': pictures,
      'rating': rating,
      'category': category,
      'price': price,
    });
  }

  static Future<List<Map<String, dynamic>>> getSellers() async {
    final db = await SQLHelper.db();
    return db.query('sellers', orderBy: "seller_id");
  }

  static Future<List<Map<String, dynamic>>> getSeller(int id) async {
    final db = await SQLHelper.db();
    return db.query('sellers',
        where: "seller_id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateSeller(
      int sellerId,
      int userId,
      Uint8List passport,
      String sellerName,
      Uint8List mainPicture,
      String description,
      List<Uint8List> pictures,
      int rating,
      String category,
      num price) async {
    final db = await SQLHelper.db();

    final data = {
      'user_id': userId,
      'passport': passport,
      'seller_name': sellerName,
      'main_picture': mainPicture,
      'description': description,
      'pictures': pictures,
      'rating': rating,
      'category': category,
      'price': price,
    };

    final result = await db
        .update('sellers', data, where: "seller_id = ?", whereArgs: [sellerId]);
    return result;
  }

  static Future<void> deleteSeller(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("sellers", where: "seller_id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Не получилось удалить продавца: $err");
    }
  }

  //поиск продавца по имени
  static Future<List<Map<String, dynamic>>> searchByName(String title) async {
    final db = await SQLHelper.db();
    return await db
        .query('sellers', where: 'seller_name LIKE ?', whereArgs: ['%$title%']);
  }

  //регистрация

  static Future<bool> isEmailRegistered(String email) async {
    final db = await SQLHelper.db();
    var result = await db.rawQuery(
        'SELECT COUNT(*) AS count FROM users WHERE email = ?', [email]);
    var count = int.parse(result.first['count'].toString());
    return count > 0;
  }

  static Future<void> registerPartOne(String email, String password) async {
    final db = await SQLHelper.db();
    var isRegistered = await isEmailRegistered(email);
    if (isRegistered) {
      throw Exception('Пользователь с таким email уже зарегистрирован.');
    } else {
      await db.execute('''
        INSERT INTO users (email, password)
        VALUES (?, ?)
      ''', [email, password]);
    }
  }

  //Эту вторую часть можно вызывать когда пользователь хочет имзенить свои данные или нужно заполнить после регистрации через гугл.
  static Future<void> registerPartTwo(
      int userId,
      String firstName,
      String lastName,
      DateTime birthDate,
      int phoneNumber,
      String address) async {
    final db = await SQLHelper.db();
    await db.execute('''
      UPDATE users
      SET 
        first_name = ?,
        last_name = ?,
        birth_date = ?,
        phone_number = ?,
        address = ?
      WHERE user_id = ?
    ''', [
      firstName,
      lastName,
      birthDate.toString(),
      phoneNumber,
      address,
      userId
    ]);
  }
  /*Пример использования
  
    if (await registration.isEmailRegistered(email)) {
    print('Пользователь с таким email уже зарегистрирован.');
  } else {
    await registration.registerPartOne(email, password);

    // Здесь вы должны получить userId из базы данных после первой части регистрации.
    // Предположим, что userId = 1

    await registration.registerPartTwo(1, 'Иван', 'Иванов', DateTime(1990, 1, 1), 1234567890, 'Улица Пушкина, дом Колотушкина');
  } */

//регистрация через гугл
  Future<bool> isGoogleAccountRegistered(String email) async {
    final db = await SQLHelper.db();
    var result = await db.rawQuery(
        'SELECT COUNT(*) AS count FROM users WHERE email = ?', [email]);
    var count = int.parse(result.first['count'].toString());
    return count > 0;
  }

  Future<void> registerViaGoogle() async {
    final db = await SQLHelper.db();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // Пользователь отменил вход через Google
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final email = googleUser.email;
      final isRegistered = await isGoogleAccountRegistered(email);
      if (isRegistered) {
        // Пользователь с таким email уже зарегистрирован
        throw Exception('Пользователь с таким email уже зарегистрирован.');
      } else {
        // Регистрация нового пользователя
        await db.execute('''
          INSERT INTO users (email)
          VALUES (?)
        ''', [email]);
      }
    } catch (error) {
      // Обработка ошибок
      print('Ошибка при регистрации через Google: $error');
    }
  }

//авторизация через гугл
  Future<bool> authenticateWithEmailPassword(
      String email, String password) async {
    final db = await SQLHelper.db();
    var result = await db.rawQuery(
        'SELECT COUNT(*) AS count FROM users WHERE email = ? AND password = ?',
        [email, password]);
    var count = int.parse(result.first['count'].toString());
    return count > 0;
  }

  Future<bool> authenticateWithGoogle() async {
    final db = await SQLHelper.db();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return false;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final email = googleUser.email;

      var result = await db.rawQuery(
          'SELECT COUNT(*) AS count FROM users WHERE email = ?', [email]);
      var count = int.parse(result.first['count'].toString());
      return count > 0;
    } catch (error) {
      print('Ошибка при аутентификации через Google: $error');
      return false;
    }
  }
}

//Пользователь загружает аватарку
Future<void> uploadAvatar(String email, File imageFile) async {
  final db = await SQLHelper.db();
  // Чтение содержимого изображения как массива байт
  Uint8List bytes = await imageFile.readAsBytes();

  // Сохранение содержимого изображения в базу данных
  await db.rawInsert('''
      UPDATE users
      SET image = ?
      WHERE email = ?
    ''', [bytes, email]);
}

  /*Пример использования 
  
  void main() async {
  var avatarUploader = AvatarUploader(database);

  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    var file = File(pickedFile.path);
    await avatarUploader.uploadAvatar('example@example.com', file);
    print('Аватарка успешно загружена');
  } else {
    print('Изображение не выбрано');
  }
} */
