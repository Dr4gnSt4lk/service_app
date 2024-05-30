import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/constants.dart';
import 'package:service_app/objects/job_type.dart';

Widget jobTypeList() => GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: [
        jobType(
            SvgPicture.asset(
              'icons/Щетка.svg',
              color: Colors.purple,
              height: 25,
            ),
            Colors.purple[50],
            'Клининг'),
        jobType(
            SvgPicture.asset(
              'icons/Инструменты.svg',
              color: Colors.orange,
              height: 23,
            ),
            Colors.orange[50],
            'Ремонт'),
        jobType(
            SvgPicture.asset(
              'icons/Малярная.svg',
              color: Colors.blue,
              height: 25,
            ),
            Colors.blue[50],
            'Покраска'),
        jobType(
            SvgPicture.asset(
              'icons/Щетка.svg',
              color: Colors.orange,
              height: 25,
            ),
            Colors.orange[50],
            'Стирка'),
        jobType(
            SvgPicture.asset(
              'icons/Кисти.svg',
              color: Colors.red,
              height: 23,
            ),
            Colors.red[50],
            'Приборы'),
        jobType(
            SvgPicture.asset(
              'icons/Гаечный ключ.svg',
              color: Colors.green,
              height: 23,
            ),
            Colors.green[50],
            'Сантехника'),
        jobType(
            SvgPicture.asset(
              'icons/Грузовик.svg',
              color: Colors.cyan,
              height: 23,
            ),
            Colors.cyan[50],
            'Перевозки'),
        jobType(
            SvgPicture.asset(
              'icons/Щетка.svg',
              color: Colors.purple,
              height: 25,
            ),
            Colors.purple[50],
            'Внешность'),
      ],
    );
