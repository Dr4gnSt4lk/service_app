import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:service_app/screens/home/profile/edit_profile.dart';

bool GeneralNotification = false;
bool Sound = false;
bool Vibrate = false;
bool SpecialOffers = false;
bool PromoDiscount = false;
bool Payments = false;

class EditNotificationPage extends StatelessWidget {
  const EditNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
              'Ред. Уведомления',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ColorfulSafeArea(
            child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 22),
            child: Container(
              height: 55,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: Text(
                      'Общие Уведомления',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                                value: GeneralNotification,
                                onChanged: (value) {}),
                          )))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 22),
            child: Container(
              height: 55,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: Text(
                      'Звук',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                                value: Sound,
                                onChanged: (value) {
                                  setState(() {
                                    Sound = value;
                                  });
                                }),
                          )))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 22),
            child: Container(
              height: 55,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: Text(
                      'Вибрация',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Transform.scale(
                            scale: 0.9,
                            child:
                                Switch(value: Vibrate, onChanged: (value) {}),
                          )))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 22),
            child: Container(
              height: 55,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: Text(
                      'Специальные Предложения',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                                value: SpecialOffers, onChanged: (value) {}),
                          )))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 22),
            child: Container(
              height: 55,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: Text(
                      'Промо и Скидки',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                                value: PromoDiscount, onChanged: (value) {}),
                          )))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 22),
            child: Container(
              height: 55,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: Text(
                      'Платежи',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Transform.scale(
                            scale: 0.9,
                            child:
                                Switch(value: Payments, onChanged: (value) {}),
                          )))
                ],
              ),
            ),
          ),
        ])));
  }
}
