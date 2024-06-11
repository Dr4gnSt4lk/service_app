import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {
                context.goNamed('Profile');
              },
              icon: Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(
                    'icons/Marker.svg',
                    color: Colors.black,
                    height: 25,
                  ))),
          titleSpacing: 0,
          title: Container(
            child: Text(
              'Приватность',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ColorfulSafeArea(
            child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 22),
            child: Container(
              height: 55,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: Text(
                      'Личные Сообщения',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                                value: AllowPrivateMessage,
                                onChanged: (value) {
                                  setState(() {
                                    AllowPrivateMessage = value;
                                  });
                                }),
                          )))
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 0, left: 22, right: 22),
              child: Container(
                height: 20,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: Colors.black)),
                child: Text(
                  'Никто не сможет написать Вам личное сообщение.',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.visible),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 22),
            child: Container(
              height: 55,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: Text(
                      'Поиск Профиля',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                                value: FindProfile,
                                onChanged: (value) {
                                  setState(() {
                                    FindProfile = value;
                                  });
                                }),
                          )))
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 0, left: 22, right: 22),
              child: Container(
                height: 20,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: Colors.black)),
                child: Text(
                  'Никто не сможет найти Ваш личный профиль.',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.visible),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 22),
            child: Container(
              height: 55,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Text(
                        'Видимость Контактных Данных',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                                value: VisibilityContactInformation,
                                onChanged: (value) {
                                  setState(() {
                                    VisibilityContactInformation = value;
                                  });
                                }),
                          )))
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 0, left: 22, right: 22),
              child: Container(
                height: 20,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: Colors.black)),
                child: Text(
                  'Никто не сможет увидеть Ваши контактные данные.',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.visible),
                ),
              )),
        ])));
  }
}
