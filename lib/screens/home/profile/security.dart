import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});
  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
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
              'Безопасность',
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
                      'Запомнить Меня',
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
                                value: RememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    RememberMe = value;
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
                height: 55,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: Colors.black)),
                child: Text(
                  'Функция «Запомнить меня» – это альтернативный способ входа, позволяющий вам входить в U без необходимости повторного ввода имени пользователя.',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.visible),
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(22, 30, 22, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 60),
                  foregroundColor: SoftColorPurple,
                  backgroundColor: Color.fromARGB(255, 240, 232, 252),
                ),
                child: Text(
                  'Сменить Пароль',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: MainColorPurple,
                  ),
                ),
                onPressed: () {},
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(22, 30, 22, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 60),
                  foregroundColor: SoftColorPurple,
                  backgroundColor: Color.fromARGB(255, 240, 232, 252),
                ),
                child: Text(
                  'Удалить Аккаунт',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: MainColorPurple,
                  ),
                ),
                onPressed: () {
                  Delite(context);
                },
              )),
        ])));
  }

  void Delite(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 250,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: Text(
                    'Удаление',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Вы уверены?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(180, 60),
                          foregroundColor: SoftColorPurple,
                          backgroundColor: Color.fromARGB(255, 240, 232, 252),
                        ),
                        child: Text(
                          'Отменить',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: MainColorPurple,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(180, 60),
                            foregroundColor: Color.fromARGB(255, 240, 232, 252),
                            backgroundColor: MainColorPurple),
                        child: Text(
                          'Да',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
