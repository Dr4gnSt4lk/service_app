import 'dart:math';

import 'package:flutter/material.dart';

const bgColor = Color(0xFFFFE6E6);
const bgDarkColor = Color(0xFFffd7d7);
const bgDetColor = Color(0xFFE1AFD1);
const addColor = Color(0xFFAD88C6);

//Чтобьі не бьіло мусора, тут напишу удтвержденную палитру для темной темьі
const Dark_bgColor = Color.fromARGB(255, 24, 26, 32);
const Dark_elementsColor = Color.fromARGB(255, 30, 33, 41);
const Dark_innactiveColor = Color.fromARGB(255, 99, 100, 105);

const MainColorPurple = Color.fromARGB(255, 113, 20, 249);
const SoftColorPurple = Color(0xFF7469B6);
const MainColorRed = Color.fromARGB(255, 212, 84, 81);

final banners = [
  'Доставка.png',
  'Клининг.png',
  'Маник.png',
  'Прачка.png',
  'Ремонт.png',
  'Стрижка.png'
];

final jobs = [
  'иконка-1.png',
  'иконка-2.png',
  'иконка-3.png',
  'иконка-4.png',
  'иконка-5.png',
  'иконка-6.png',
  'иконка-7.png',
  'иконка-8.png',
];

final work = [
  'Тех. осмотр авто',
  'Визажист',
  'Покраска фасадов',
  'Стрижка на дому',
  'Уборка квартир',
  'Уборка санузлов',
  'Быстрая доставка',
  'Рекламные услуги',
];

final names = [
  'Алексей Смирнов',
  'Мария Петрова',
  'Виктор Соколов',
  'Степан Леонтьев',
  'Елена Кузнецовa',
  'Наталья Новикова',
  'Николай Парасюк',
  'Аслан Занурин'
];

var randomReviews = List<int>.generate(8, (_) => Random().nextInt(500) + 25);
var randomPrices = List<int>.generate(8, (_) => Random().nextInt(5000) + 1000);
var randomRatings = List.generate(8, (_) => 2 + Random().nextDouble() * 3.0);

//Редактировать Уведомления
bool GeneralNotification = false;
bool Sound = false;
bool Vibrate = false;
bool IncomingMessages = false;
bool SpecialOffers = false;
bool PromoDiscount = false;
bool NewCategory = false;
bool Update = false;
bool Payments = false;

//Безопасность
bool RememberMe = false;

//Приватность
bool AllowPrivateMessage = false;
bool FindProfile = false;
bool VisibilityContactInformation = false;
