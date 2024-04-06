import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:infinity_page_view/infinity_page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                //padding: EdgeInsets.only(left: 10),
                onPressed: () {},
                icon: SvgPicture.asset(
                  'icons/Колокол.svg',
                  height: 25,
                )),
            IconButton(
                visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                onPressed: () {},
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
              Container(
                margin: EdgeInsets.only(left: 18, right: 18),
                height: 205,
                width: MediaQuery.of(context).size.width,
                child: BannerList(),
              )
            ]),
            Container(
              height: 1000,
              color: Colors.blue,
            )
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
  final banners = [
    'Доставка.png',
    'Клининг.png',
    'Маник.png',
    'Прачка.png',
    'Ремонт.png',
    'Стрижка.png'
  ];
  double currentBannerIndex = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentBannerIndex = controller.page!;
      });
    });
    super.initState();
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
                // Handle your tap here.
                print('Banner ${banners[index]} was clicked.');
              },
              child: Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // takes the full width of the screen
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
