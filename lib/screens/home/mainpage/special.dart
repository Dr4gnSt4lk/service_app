import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

class SpecialPage extends StatelessWidget {
  const SpecialPage({super.key});

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
                'Особые предложения',
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
                      GoRouter.of(context).pop();
                    },
                    icon: Transform.flip(
                        child: SvgPicture.asset(
                      'icons/3 точки.svg',
                      height: 25,
                    ))),
              )
            ]),
        body: ColorfulSafeArea(
            child: ListView.builder(
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(left: 18, right: 18),
                      height: 195,
                      width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onTap: () {
                          print('Banner ${banners[index]} was clicked.');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset('banners/${banners[index]}',
                              fit: BoxFit.fitWidth),
                        ),
                      ));
                })));
  }
}
