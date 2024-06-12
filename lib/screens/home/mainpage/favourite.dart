import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  bool Tag1isPressed = true;
  bool Tag2isPressed = false;
  bool Tag3isPressed = false;
  bool Tag4isPressed = false;
  bool Tag5isPressed = false;
  bool Tag6isPressed = false;
  bool isChecked = false;
  bool services = true;
  var randomReviews = List<int>.generate(8, (_) => Random().nextInt(500) + 25);
  var randomPrices =
      List<int>.generate(8, (_) => Random().nextInt(5000) + 1000);
  var randomRatings = List.generate(8, (_) => 2 + Random().nextDouble() * 3.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
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
                      child: SvgPicture.asset(
                    'icons/3 точки.svg',
                    height: 25,
                  ))),
            )
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(125),
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
                                      color: services
                                          ? SoftColorPurple
                                          : Colors.grey,
                                      width: services ? 3 : 1))),
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'Услуги',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: services
                                        ? SoftColorPurple
                                        : Colors.grey),
                              )),
                        ),
                        onTap: () {
                          services
                              ? null
                              : setState(() {
                                  services = true;
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
                                      color: !services
                                          ? SoftColorPurple
                                          : Colors.grey,
                                      width: !services ? 4 : 1))),
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'Продавцы',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: !services
                                        ? SoftColorPurple
                                        : Colors.grey),
                              )),
                        ),
                        onTap: () {
                          !services
                              ? null
                              : setState(() {
                                  services = false;
                                });
                        },
                      ))
                    ]),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 13, 0, 13),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 3.0, color: SoftColorPurple),
                                    foregroundColor: Tag1isPressed
                                        ? Colors.white
                                        : SoftColorPurple,
                                    backgroundColor: Tag1isPressed
                                        ? SoftColorPurple
                                        : Colors.white),
                                child: Text(
                                  'Все',
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
                                    side: const BorderSide(
                                        width: 3.0, color: SoftColorPurple),
                                    foregroundColor: Tag2isPressed
                                        ? Colors.white
                                        : SoftColorPurple,
                                    backgroundColor: Tag2isPressed
                                        ? SoftColorPurple
                                        : Colors.white),
                                child: Text(
                                  'Клининг',
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
                                    side: const BorderSide(
                                        width: 3.0, color: SoftColorPurple),
                                    foregroundColor: Tag3isPressed
                                        ? Colors.white
                                        : SoftColorPurple,
                                    backgroundColor: Tag3isPressed
                                        ? SoftColorPurple
                                        : Colors.white),
                                child: Text(
                                  'Ремонт',
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
                                    side: const BorderSide(
                                        width: 3.0, color: SoftColorPurple),
                                    foregroundColor: Tag4isPressed
                                        ? Colors.white
                                        : SoftColorPurple,
                                    backgroundColor: Tag4isPressed
                                        ? SoftColorPurple
                                        : Colors.white),
                                child: Text(
                                  'Покраска',
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
                                    side: const BorderSide(
                                        width: 3.0, color: SoftColorPurple),
                                    foregroundColor: Tag5isPressed
                                        ? Colors.white
                                        : SoftColorPurple,
                                    backgroundColor: Tag5isPressed
                                        ? SoftColorPurple
                                        : Colors.white),
                                child: Text(
                                  'Готовка',
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
                                    side: const BorderSide(
                                        width: 3.0, color: SoftColorPurple),
                                    foregroundColor: Tag6isPressed
                                        ? Colors.white
                                        : SoftColorPurple,
                                    backgroundColor: Tag6isPressed
                                        ? SoftColorPurple
                                        : Colors.white),
                                child: Text(
                                  'Доставка',
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
                      )),
                ],
              ))),
      body: ColorfulSafeArea(
        child: services ? Services() : Sellers(),
      ),
    );
  }

  Widget Services() {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return buildCard(index);
          },
        ));
  }

  Widget Sellers() {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return buildCard(index);
          },
        ));
  }

  Widget buildCard(int index) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: InkWell(
            onTap: () {},
            child: Container(
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
                            child: Image.asset(
                              'jobs/${jobs[index]}',
                              fit: BoxFit.fill,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 9, 20),
                        child: Container(
                          height: 115,
                          width: 155,
                          decoration: BoxDecoration(),
                          child: Column(
                            children: [
                              Flexible(
                                  child: Container(
                                width: 150,
                                child: Text(
                                  '${names[index]}',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]),
                                ),
                              )),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  width: 150,
                                  child: Text(
                                    '${work[index]} ',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(top: 8),
                                  width: 150,
                                  child: Text(
                                    '${(randomPrices[index] ~/ 100) * 100}' +
                                        ' ₽',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      color: SoftColorPurple,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(2, 15, 0, 0),
                                  width: 150,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 15,
                                      ),
                                      Text(
                                        ' ${randomRatings[index].toStringAsFixed(2)}' +
                                            '  |' +
                                            '  ${randomReviews[index]}' +
                                            ' отзывов',
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
                            decoration: BoxDecoration(),
                            child: IconButton(
                                onPressed: () {
                                  deliteFavorite(index);
                                },
                                icon: Transform.flip(
                                    flipX: true,
                                    child: SvgPicture.asset(
                                      'icons/Закладка 3.svg',
                                      color: SoftColorPurple,
                                      height: 25,
                                    ))),
                          ))
                    ],
                  )
                ],
              ),
            )));
  }

  void deliteFavorite(int index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 350,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: Text(
                    'Удалить из Избранных?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Container(
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
                                child: Image.asset(
                                  'jobs/${jobs[index]}',
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 9, 20),
                            child: Container(
                              height: 115,
                              width: 155,
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Flexible(
                                      child: Container(
                                    width: 150,
                                    child: Text(
                                      '${names[index]}',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600]),
                                    ),
                                  )),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      width: 150,
                                      child: Text(
                                        '${work[index]} ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 8),
                                      width: 150,
                                      child: Text(
                                        '${(randomPrices[index] ~/ 100) * 100}' +
                                            ' ₽',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900,
                                          color: SoftColorPurple,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(2, 15, 0, 0),
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                            size: 15,
                                          ),
                                          Text(
                                            ' ${randomRatings[index].toStringAsFixed(2)}' +
                                                '  |' +
                                                '  ${randomReviews[index]}' +
                                                ' отзывов',
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
                                decoration: BoxDecoration(),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Transform.flip(
                                        flipX: true,
                                        child: SvgPicture.asset(
                                          'icons/Закладка 3.svg',
                                          color: SoftColorPurple,
                                          height: 25,
                                        ))),
                              ))
                        ],
                      )
                    ],
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
                          foregroundColor: Tag1isPressed
                              ? SoftColorPurple
                              : Color.fromARGB(255, 240, 232, 252),
                          backgroundColor:
                              Tag1isPressed ? Colors.white : SoftColorPurple,
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
                            foregroundColor: Tag1isPressed
                                ? Color.fromARGB(255, 240, 232, 252)
                                : SoftColorPurple,
                            backgroundColor: Tag1isPressed
                                ? SoftColorPurple
                                : Color.fromARGB(255, 240, 232, 252)),
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
    // GoRouter.of(context).pop();
  }
}
