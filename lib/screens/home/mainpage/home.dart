import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:loop_page_view/loop_page_view.dart';
import 'package:service_app/objects/job_type.dart';
import 'package:service_app/objects/job_type_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool Tag1isPressed = true;
  bool Tag2isPressed = false;
  bool Tag3isPressed = false;
  bool Tag4isPressed = false;
  bool Tag5isPressed = false;
  bool Tag6isPressed = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leadingWidth: 53,
          leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: Image.asset('icons/face1.png').image,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Доброе утро👋',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 2),
              Text(
                'Игорь Пирожков',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
          actions: [
            IconButton(
                visualDensity: VisualDensity(horizontal: -4, vertical: -1),
                onPressed: () {
                  context.goNamed('Notification');
                },
                icon: SvgPicture.asset(
                  'icons/Колокол.svg',
                  height: 25,
                )),
            IconButton(
                visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                onPressed: () {
                  context.goNamed('Favourite');
                },
                icon: SvgPicture.asset('icons/Закладка 1.svg', height: 25)),
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
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
                          color: iconColor,
                          height: 18,
                        ))
                  ]),
                ),
                SizedBox(height: 15)
              ])),
        ),
        body: ColorfulSafeArea(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(children: [
              Row(children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 18, top: 5),
                        child: Text(
                          'Особые предложения',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ))),
                Container(
                    margin: EdgeInsets.only(right: 18, top: 6),
                    child: GestureDetector(
                      child: Text(
                        'Подробнее',
                        style: TextStyle(
                            color: iconColor, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        context.goNamed('Special');
                      },
                    ))
              ]),
              Container(
                margin: EdgeInsets.only(left: 18, right: 18),
                height: 205,
                width: MediaQuery.of(context).size.width,
                child: BannerList(),
              )
            ]),
            Column(children: [
              Row(children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 18, top: 5),
                        child: Text(
                          'Сервисы',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ))),
                Container(
                    margin: EdgeInsets.only(right: 18, top: 6),
                    child: GestureDetector(
                      child: Text(
                        'Подробнее',
                        style: TextStyle(
                            color: iconColor, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        context.goNamed('Services');
                      },
                    ))
              ]),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 205,
                  width: MediaQuery.of(context).size.width,
                  child: jobTypeList())
            ]),
            Column(children: [
              Row(children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 18, top: 5),
                        child: Text(
                          'Популярные услуги',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ))),
                Container(
                    margin: EdgeInsets.only(right: 18, top: 6),
                    child: GestureDetector(
                      child: Text(
                        'Подробнее',
                        style: TextStyle(
                            color: iconColor, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        context.goNamed('Services');
                      },
                    ))
              ]),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(top: 13, bottom: 13),
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
                  ))
            ]),
            Container(
                color: Colors.grey[100],
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
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
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 0),
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
                                              padding: EdgeInsets.fromLTRB(
                                                  2, 15, 0, 0),
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
                                      padding:
                                          EdgeInsets.fromLTRB(20, 20, 9, 0),
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
                                                  index > 4
                                                      ? 'icons/Закладка 1.svg'
                                                      : 'icons/Закладка 3.svg',
                                                  height: index > 4 ? 21 : 25,
                                                  color: iconColor,
                                                ))),
                                      ))
                                ],
                              )
                            ],
                          ),
                        )))),
          ],
        ))));
  }
}

class BannerList extends StatefulWidget {
  @override
  _BannerListState createState() => _BannerListState();
}

class _BannerListState extends State<BannerList> {
  final controller = PageController();
  double currentBannerIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentBannerIndex < 5) {
        currentBannerIndex++;
        controller.animateToPage(
          currentBannerIndex.round(),
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        controller.animateToPage(
          0,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
    controller.addListener(() {
      setState(() {
        currentBannerIndex = controller.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: controller,
          itemCount: banners.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print('Banner ${banners[index]} was clicked.');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('banners/${banners[index]}',
                    fit: BoxFit.fitWidth),
              ),
            );
          },
          onPageChanged: (index) {
            setState(() {});
          },
        ),
        Positioned(
            bottom: 38.0,
            left: 0,
            right: 0,
            child: DotsIndicator(
                dotsCount: banners.length,
                position: currentBannerIndex.round(),
                decorator: DotsDecorator(
                    activeColor: Colors.white,
                    size: Size(9, 7),
                    spacing: EdgeInsets.all(2),
                    activeSize: const Size(18, 5),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)))))
      ],
    );
  }
}
