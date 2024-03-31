import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ColorfulSafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Expanded(
                  child: Container(
                      height: 54,
                      margin: EdgeInsets.only(left: 80, right: 80),
                      child: TextButton(
                        onPressed: () {
                          context.goNamed('Login');
                        },
                        child: Text(
                          'Войти',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(iconColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19),
                                    side: BorderSide(color: iconColor)))),
                      )))
            ]),
            Row(children: [
              Expanded(
                  child: Container(
                      height: 54,
                      margin: EdgeInsets.only(left: 80, right: 80, top: 25),
                      child: TextButton(
                        onPressed: () {
                          context.goNamed('Register');
                        },
                        child: Text(
                          'Регистрация',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(iconColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19),
                                    side: BorderSide(color: iconColor)))),
                      )))
            ]),
            Container(
                margin: EdgeInsets.only(top: 16),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('войти как', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 4),
                  GestureDetector(
                    child: Text(
                      'гость',
                      style: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    onTap: () {
                      //context.goNamed('Register');
                    },
                  )
                ]))
          ],
        )));
  }
}
