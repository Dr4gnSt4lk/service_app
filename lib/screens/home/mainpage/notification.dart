import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
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
              'Уведомления',
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
            )
          ],
        ),
        body: ColorfulSafeArea(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(left: 17, top: 20, bottom: 20),
              child: Text(
                'Сегодня',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.circle_notifications, //Заглушка с иконками
                              size: 90,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 70,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Flexible(
                                    child: Container(
                                  width: 240,
                                  child: Text(
                                    'Оплата подтверждена',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    width: 240,
                                    child: Text(
                                      'Вы успешно оплатили услугу',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.circle_notifications, //Заглушка с иконками
                              size: 90,
                              color: Colors.pinkAccent,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 70,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Flexible(
                                    child: Container(
                                  width: 240,
                                  child: Text(
                                    'Новый сервис',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    width: 240,
                                    child: Text(
                                      'Массаж теперь доступен',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 17, top: 20, bottom: 20),
              child: Text(
                'Вчера',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.circle_notifications, //Заглушка с иконками
                              size: 90,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 70,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Flexible(
                                    child: Container(
                                  width: 240,
                                  child: Text(
                                    'Особые предложения',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    width: 240,
                                    child: Text(
                                      'Новый список предложений',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 17, top: 20, bottom: 20),
              child: Text(
                '18 апреля, 2024',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.circle_notifications, //Заглушка с иконками
                              size: 90,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 70,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Flexible(
                                    child: Container(
                                  width: 240,
                                  child: Text(
                                    'Привязка карты',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    width: 240,
                                    child: Text(
                                      'Банковская карта привязана',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.circle_notifications, //Заглушка с иконками
                              size: 90,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 70,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Flexible(
                                    child: Container(
                                  width: 240,
                                  child: Text(
                                    'Создание аккаунта',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    width: 240,
                                    child: Text(
                                      'Ваш аккаунт успешно создан',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ]),
        )));
  }
}
