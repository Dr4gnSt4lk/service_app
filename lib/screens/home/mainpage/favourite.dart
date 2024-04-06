import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool Tag1isPressed = false;
  bool Tag2isPressed = false;
  bool Tag3isPressed = false;
  bool Tag4isPressed = false;
  bool Tag5isPressed = false;
  bool Tag6isPressed = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(15, 0, 0, 0),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {
                // GoRouter.of(context).pop();
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
              'Избранное',
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
          bottom: PreferredSize(
              preferredSize: Size(0, 50),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side:
                                const BorderSide(width: 3.0, color: iconColor),
                            foregroundColor:
                                Tag1isPressed ? Colors.white : iconColor,
                            backgroundColor:
                                Tag1isPressed ? iconColor : Colors.white),
                        child: Text(
                          'Сиськи',
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
                                const BorderSide(width: 3.0, color: iconColor),
                            foregroundColor:
                                Tag2isPressed ? Colors.white : iconColor,
                            backgroundColor:
                                Tag2isPressed ? iconColor : Colors.white),
                        child: Text(
                          'Письки',
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
                                const BorderSide(width: 3.0, color: iconColor),
                            foregroundColor:
                                Tag3isPressed ? Colors.white : iconColor,
                            backgroundColor:
                                Tag3isPressed ? iconColor : Colors.white),
                        child: Text(
                          'Попки',
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
                                const BorderSide(width: 3.0, color: iconColor),
                            foregroundColor:
                                Tag4isPressed ? Colors.white : iconColor,
                            backgroundColor:
                                Tag4isPressed ? iconColor : Colors.white),
                        child: Text(
                          'Яйки',
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
                                const BorderSide(width: 3.0, color: iconColor),
                            foregroundColor:
                                Tag5isPressed ? Colors.white : iconColor,
                            backgroundColor:
                                Tag5isPressed ? iconColor : Colors.white),
                        child: Text(
                          'Пуки',
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
                                const BorderSide(width: 3.0, color: iconColor),
                            foregroundColor:
                                Tag6isPressed ? Colors.white : iconColor,
                            backgroundColor:
                                Tag6isPressed ? iconColor : Colors.white),
                        child: Text(
                          'Каки',
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
              ))),
      body: ColorfulSafeArea(
        child: Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
            child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(12, 20, 9, 20),
                                child: Container(
                                  height: 115,
                                  width: 115,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    Icons.alarm,
                                    size: 100,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 9, 20),
                                child: Container(
                                  height: 115,
                                  width: 155,
                                  decoration: BoxDecoration(
                                      // border: Border.all(
                                      //   color: Colors.white,
                                      //   width: 4,
                                      // ),
                                      ),
                                  child: Column(
                                    children: [
                                      Flexible(
                                          child: Container(
                                        width: 150,
                                        child: Text(
                                          'Илья Пруденко',
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      )),
                                      Flexible(
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          width: 150,
                                          child: Text(
                                            'Сосание писек ',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          padding: EdgeInsets.only(top: 8),
                                          width: 150,
                                          child: Text(
                                            '300' + ' ₽',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w900,
                                              color: iconColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(2, 15, 0, 0),
                                          width: 150,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                                size: 15,
                                              ),
                                              Text(
                                                ' 4.8' +
                                                    '  |' +
                                                    '  6240' +
                                                    ' отзьівов',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 9, 0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        // border: Border.all(
                                        //   color: Colors.white,
                                        //   width: 4,
                                        // ),
                                        ),
                                    child: IconButton(
                                        onPressed: () {
                                          // GoRouter.of(context).pop();
                                        },
                                        icon: Transform.flip(
                                            flipX: true,
                                            child: SvgPicture.asset(
                                              'icons/Закладка 3.svg',
                                              color: iconColor,
                                              height: 25,
                                            ))),
                                  ))
                            ],
                          )
                        ],
                      ),
                    )))),
        // Text(
        //   'Я ничего не сделал, поетому смотрите на текст',
        //   style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
    );
  }
}
