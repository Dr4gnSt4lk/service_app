import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

bool darkTheme = false;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: CircleAvatar(
                      radius: 60,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey.shade200,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage('icons/face.png'),
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(Icons.add_a_photo,
                                    color: Colors.black),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      50,
                                    ),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 4),
                                      color: Colors.black.withOpacity(
                                        0.3,
                                      ),
                                      blurRadius: 3,
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
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
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: InkWell(
                onTap: () {},
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
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset('icons/Профиль.svg'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Container(
                            child: Text(
                          'Редактировать Профиль',
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: InkWell(
                onTap: () {},
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
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            'icons/Колокол.svg',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Container(
                            child: Text(
                          'Настройки Уведомлений',
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: InkWell(
                onTap: () {},
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
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            'icons/Колокол.svg',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Container(
                            child: Text(
                          'Безопасность',
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: InkWell(
                onTap: () {},
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
                          height: 25,
                          width: 25,
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
                            child:
                                Switch(value: darkTheme, onChanged: (value) {}),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: InkWell(
                onTap: () {},
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
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            'icons/Замок.svg',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Container(
                            child: Text(
                          'Приватность',
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: InkWell(
                onTap: () {},
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
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            'icons/Замок.svg',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Container(
                            child: Text(
                          'Центр Помощи',
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: InkWell(
                onTap: () {},
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
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            'icons/Замок.svg',
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
}
