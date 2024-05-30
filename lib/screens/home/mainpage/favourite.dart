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
              preferredSize: Size.fromHeight(80),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 13),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    width: 3.0, color: iconColor),
                                foregroundColor:
                                    Tag1isPressed ? Colors.white : iconColor,
                                backgroundColor:
                                    Tag1isPressed ? iconColor : Colors.white),
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
                                    width: 3.0, color: iconColor),
                                foregroundColor:
                                    Tag2isPressed ? Colors.white : iconColor,
                                backgroundColor:
                                    Tag2isPressed ? iconColor : Colors.white),
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
                                    width: 3.0, color: iconColor),
                                foregroundColor:
                                    Tag3isPressed ? Colors.white : iconColor,
                                backgroundColor:
                                    Tag3isPressed ? iconColor : Colors.white),
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
                                    width: 3.0, color: iconColor),
                                foregroundColor:
                                    Tag4isPressed ? Colors.white : iconColor,
                                backgroundColor:
                                    Tag4isPressed ? iconColor : Colors.white),
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
                                    width: 3.0, color: iconColor),
                                foregroundColor:
                                    Tag5isPressed ? Colors.white : iconColor,
                                backgroundColor:
                                    Tag5isPressed ? iconColor : Colors.white),
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
                                    width: 3.0, color: iconColor),
                                foregroundColor:
                                    Tag6isPressed ? Colors.white : iconColor,
                                backgroundColor:
                                    Tag6isPressed ? iconColor : Colors.white),
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
                  )))),
      body: ColorfulSafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
                itemCount: 4,
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          width: 150,
                                          child: Text(
                                            '${work[index]} ',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
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
      ),
    );
  }
}
