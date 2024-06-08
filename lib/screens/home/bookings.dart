import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  bool upcoming = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            'Мои Записи',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Row(children: [
                Expanded(
                    child: GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: upcoming ? iconColor : Colors.grey,
                                width: upcoming ? 3 : 1))),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Предстоящее',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: upcoming ? iconColor : Colors.grey),
                        )),
                  ),
                  onTap: () {
                    upcoming
                        ? null
                        : setState(() {
                            upcoming = true;
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
                                color: !upcoming ? iconColor : Colors.grey,
                                width: !upcoming ? 4 : 1))),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Выполнено',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: !upcoming ? iconColor : Colors.grey),
                        )),
                  ),
                  onTap: () {
                    !upcoming
                        ? null
                        : setState(() {
                            upcoming = false;
                          });
                  },
                ))
              ]),
            ),
          )),
      body: ColorfulSafeArea(child: upcoming ? Upcoming() : Completed()),
    );
  }

  Widget Upcoming() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
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
                      child: Image.asset(
                        'jobs/${jobs[4]}',
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 9, 20),
                  child: Container(
                    height: 115,
                    width: 150,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            width: 150,
                            child: Text(
                              'Уборка квартир',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            child: Container(
                          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                          width: 150,
                          child: Text(
                            'Елена Кузнецова',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 16, 50, 0),
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: iconColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Предстоящее',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
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
                      child: Image.asset(
                        'jobs/${jobs[1]}',
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 9, 20),
                  child: Container(
                    height: 115,
                    width: 150,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            width: 150,
                            child: Text(
                              'Визажист',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            child: Container(
                          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                          width: 150,
                          child: Text(
                            'Мария Петрова',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 16, 50, 0),
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: iconColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Предстоящее',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Widget Completed() {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
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
                    child: Image.asset(
                      'jobs/${jobs[0]}',
                      fit: BoxFit.fill,
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 9, 20),
                child: Container(
                  height: 115,
                  width: 150,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          width: 150,
                          child: Text(
                            'Тех. осмотр авто',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                          child: Container(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        width: 150,
                        child: Text(
                          'Алексей Смирнов',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 50, 0),
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Выполнено',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
    ]);
  }
}
