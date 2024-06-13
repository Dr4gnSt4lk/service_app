import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:service_app/screens/home/profile/edit_profile.dart';

bool darkTheme = false;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {},
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
              'Профиль',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 3, 10, 0),
              child: IconButton(
                  onPressed: () {
                    // GoRouter.of(context).pop();
                  },
                  icon: Transform.flip(
                      flipX: true,
                      child: SvgPicture.asset(
                        'icons/3 точки.svg',
                        height: 25,
                      ))),
            ),
          ],
        ),
        body: ColorfulSafeArea(
            child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(140, 0, 140, 0),

              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('icons/face.png'),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: -4,
                                right: -4,
                                child: Container(
                                  child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: SvgPicture.asset(
                                        'icons/Картинка.svg',
                                        width: 35,
                                        height: 35,
                                        color: SoftColorPurple,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Игорь Пирожков',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'yllya_prudenko@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                )),
            SizedBox(
              height: 50,
            ),
            EditProfileBuilder('EditProfile', 'Редактировать Профиль',
                'icons/Профиль_тонкий.svg'),
            EditProfileBuilder('EditNotification', 'Настройки Уведомлений',
                'icons/Колокол.svg'),
            EditProfileBuilder(
                'Security', 'Безопасность', 'icons/Безопасность.svg'),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Container(
                height: 50,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: Colors.black)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 35,
                        width: 35,
                        child: SvgPicture.asset(
                          'icons/Глаз_вкл.svg',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: Container(
                          child: Text(
                        'Тёмный Режим',
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
                                  value: darkTheme,
                                  onChanged: (value) {
                                    setState(() {
                                      setState(() {
                                        darkTheme = value;
                                      });
                                    });
                                  }),
                            )))
                  ],
                ),
              ),
            ),
            EditProfileBuilder('Privacy', 'Приватность', 'icons/Замок.svg'),
            EditProfileBuilder(
                'HelpCenter', 'Центр Помощи', 'icons/Центр_Помощи.svg'),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: InkWell(
                onTap: () {
                  logOut(context);
                },
                child: Container(
                  height: 50,
                  // decoration: BoxDecoration(
                  //     border: Border.all(width: 1, color: Colors.black)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 21),
                          height: 35,
                          width: 35,
                          child: SvgPicture.asset(
                            'icons/Выйти.svg',
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Container(
                            child: Text(
                          'Выйти',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )));
  }

  Padding EditProfileBuilder(String Navigation, String Name, String Icon) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: InkWell(
        onTap: () {
          context.goNamed(Navigation);
        },
        child: Container(
          height: 50,
          // decoration: BoxDecoration(
          //     border: Border.all(width: 1, color: Colors.black)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 22),
                  height: 37,
                  width: 37,
                  child: SvgPicture.asset(Icon),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 4,
                child: Container(
                    child: Text(
                  Name,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset('icons/Стрелка_2.svg'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void logOut(context) {
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
                    'Выход',
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
                    'Вы уверены, что хотите выйти?',
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
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(180, 60),
                            foregroundColor: Color.fromARGB(255, 240, 232, 252),
                            backgroundColor: SoftColorPurple),
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
