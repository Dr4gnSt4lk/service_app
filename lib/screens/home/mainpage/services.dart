import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:service_app/objects/job_type_list.dart';
import 'package:service_app/objects/job_type_list_full.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

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
                'Все сервисы',
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
            child: Container(
                margin: EdgeInsets.only(top: 15),
                height: 305,
                width: MediaQuery.of(context).size.width,
                child: jobTypeListFull())));
  }
}
