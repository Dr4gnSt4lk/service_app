import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});
  @override
  _HelpCenterPageState createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  bool Tag1isPressed = true;
  bool Tag2isPressed = false;
  bool Tag3isPressed = false;
  bool Tag4isPressed = false;
  bool Tag5isPressed = false;
  bool Tag6isPressed = false;
  bool isChecked = false;
  bool faq = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
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
              'Центр Помощи',
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
                      child: SvgPicture.asset(
                    'icons/3 точки.svg',
                    height: 25,
                  ))),
            )
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    padding: EdgeInsets.only(left: 18, right: 18),
                    child: Row(children: [
                      Expanded(
                          child: GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          faq ? SoftColorPurple : Colors.grey,
                                      width: faq ? 3 : 1))),
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'FAQ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: faq ? SoftColorPurple : Colors.grey),
                              )),
                        ),
                        onTap: () {
                          faq
                              ? null
                              : setState(() {
                                  faq = true;
                                });
                        },
                      )),
                      Expanded(
                          child: GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          !faq ? SoftColorPurple : Colors.grey,
                                      width: !faq ? 4 : 1))),
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'Связаться с нами',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        !faq ? SoftColorPurple : Colors.grey),
                              )),
                        ),
                        onTap: () {
                          !faq
                              ? null
                              : setState(() {
                                  faq = false;
                                });
                        },
                      ))
                    ]),
                  ),
                ],
              ))),
      body: ColorfulSafeArea(
        child: faq ? FAQPage() : ContactUsPage(),
      ),
    );
  }

  Widget FAQPage() {
    return Padding(
        padding: EdgeInsets.only(left: 0, right: 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Tags(),
            Search(),
            FAQ_Builder(
              'Кто такие фиксики?',
              'Функция «Запомнить меня» – это альтернативный способ входа, позволяющий вам входить в U без необходимости повторного ввода имени пользователя.',
            ),
            FAQ_Builder(
              'Кто такие фиксики?',
              'Функция «Запомнить меня» – это альтернативный способ входа, позволяющий вам входить в U без необходимости повторного ввода имени пользователя.',
            ),
            FAQ_Builder(
              'Кто такие фиксики?',
              'Функция «Запомнить меня» – это альтернативный способ входа, позволяющий вам входить в U без необходимости повторного ввода имени пользователя.',
            ),
          ],
        ));
  }

  Container Search() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        IconButton(
          onPressed: null,
          icon: SvgPicture.asset(
            'icons/Пуппа.svg',
            color: Colors.grey,
            height: 18,
          ),
        ),
        Expanded(
            child: Container(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Поиск...",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ))),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'icons/Две полоски.svg',
              color: SoftColorPurple,
              height: 18,
            ))
      ]),
    );
  }

  Padding FAQ_Builder(
    String Question,
    String Answer,
  ) {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: EasyFaq(
          question: Question,
          answer: Answer,
          backgroundColor: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(25),
          collapsedIcon: Padding(
            padding: EdgeInsets.only(right: 5),
            child: SvgPicture.asset('icons/ЖирнаяСтрелкаВниз.svg',
                color: SoftColorPurple),
          ),
          questionTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          anserTextStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.visible,
          ),
        ));
  }

  SingleChildScrollView Tags() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 13, 0, 13),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side:
                          const BorderSide(width: 3.0, color: SoftColorPurple),
                      foregroundColor:
                          Tag1isPressed ? Colors.white : SoftColorPurple,
                      backgroundColor:
                          Tag1isPressed ? SoftColorPurple : Colors.white),
                  child: Text(
                    'Главное',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Tag1isPressed = !Tag1isPressed;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side:
                          const BorderSide(width: 3.0, color: SoftColorPurple),
                      foregroundColor:
                          Tag2isPressed ? Colors.white : SoftColorPurple,
                      backgroundColor:
                          Tag2isPressed ? SoftColorPurple : Colors.white),
                  child: Text(
                    'Аккаунт',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Tag2isPressed = !Tag2isPressed;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side:
                          const BorderSide(width: 3.0, color: SoftColorPurple),
                      foregroundColor:
                          Tag3isPressed ? Colors.white : SoftColorPurple,
                      backgroundColor:
                          Tag3isPressed ? SoftColorPurple : Colors.white),
                  child: Text(
                    'Сервис',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Tag3isPressed = !Tag3isPressed;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side:
                          const BorderSide(width: 3.0, color: SoftColorPurple),
                      foregroundColor:
                          Tag4isPressed ? Colors.white : SoftColorPurple,
                      backgroundColor:
                          Tag4isPressed ? SoftColorPurple : Colors.white),
                  child: Text(
                    'Платежи',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Tag4isPressed = !Tag4isPressed;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side:
                          const BorderSide(width: 3.0, color: SoftColorPurple),
                      foregroundColor:
                          Tag5isPressed ? Colors.white : SoftColorPurple,
                      backgroundColor:
                          Tag5isPressed ? SoftColorPurple : Colors.white),
                  child: Text(
                    'Доставка',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Tag5isPressed = !Tag5isPressed;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side:
                          const BorderSide(width: 3.0, color: SoftColorPurple),
                      foregroundColor:
                          Tag6isPressed ? Colors.white : SoftColorPurple,
                      backgroundColor:
                          Tag6isPressed ? SoftColorPurple : Colors.white),
                  child: Text(
                    'Интерфейс',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Tag6isPressed = !Tag6isPressed;
                    });
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget ContactUsPage() {
    return Padding(
        padding: EdgeInsets.only(left: 0, right: 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ContactUsNavigation('Profile', 'Обслуживание клиентов',
                'icons/Наушники_с_Микро.svg'),
            ContactUsNavigation(
                'Profile', 'Оставить тикет', 'icons/ПлатВопросы.svg'),
          ],
        ));
  }

  Padding ContactUsNavigation(String Navigation, String Name, String Icon) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
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
                  child: SvgPicture.asset(
                    Icon,
                    color: SoftColorPurple,
                  ),
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
}
