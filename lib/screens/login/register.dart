import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:service_app/sqlFunc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ColorfulSafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 10, left: 2),
                  child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: Transform.flip(
                          flipX: true,
                          child: SvgPicture.asset(
                            'icons/Marker.svg',
                            color: Colors.black,
                            height: 25,
                          )))),
              Container(
                margin: EdgeInsets.only(top: 60, left: 18),
                alignment: Alignment.center,
                child: Text(
                  'Регистрация Аккаунта',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
                ),
              ),
              Container(
                  height: 54,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 55),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        child: SvgPicture.asset(
                          'icons/Письмо.svg',
                          height: 15,
                        ),
                      ),
                      Expanded(
                          child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.grey[200],
                        child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                contentPadding: EdgeInsets.only(left: 10))),
                      ))
                    ],
                  )),
              Container(
                  height: 54,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 3, left: 2),
                        child: SvgPicture.asset(
                          'icons/Замок.svg',
                          height: 18,
                        ),
                      ),
                      Expanded(
                          child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.grey[200],
                        child: TextField(
                            obscureText: !_passwordVisible,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Пароль',
                                contentPadding: EdgeInsets.only(left: 10))),
                      )),
                      Container(
                          margin: EdgeInsets.only(
                              top: _passwordVisible ? 6 : 4, right: 4),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: _passwordVisible
                                  ? SvgPicture.asset(
                                      'icons/Глаз выкл.svg',
                                      height: 20,
                                    )
                                  : SvgPicture.asset(
                                      'icons/Глаз вкл.svg',
                                      height: 17,
                                    )))
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(width: 2.7, color: iconColor)),
                      value: _rememberMe,
                      activeColor: iconColor,
                      onChanged: (newBool) {
                        setState(() {
                          _rememberMe = !_rememberMe;
                        });
                      },
                    ),
                  ),
                  Text(
                    'Запомнить меня',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
              Row(children: [
                Expanded(
                    child: Container(
                        height: 54,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                        child: TextButton(
                          onPressed: () async {
                            if (await SQLHelper.isEmailRegistered(
                                emailController.text)) {
                              print(
                                  'Пользователь с таким email уже зарегистрирован.');
                            } else {
                              await SQLHelper.registerPartOne(
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                          child: Text(
                            'Зарегистрироваться',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(iconColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(31),
                                      side: BorderSide(color: iconColor)))),
                        )))
              ]),
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Divider(
                          color: Colors.black12,
                          height: 36,
                        )),
                  ),
                  Text(
                    "Войти с помощью",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Divider(
                          color: Colors.black12,
                          height: 36,
                        )),
                  ),
                ]),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 100,
                            margin: EdgeInsets.only(top: 8),
                            child: Material(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                color: Colors.white,
                                elevation: 2,
                                child: InkWell(
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child:
                                          SvgPicture.asset('icons/Google.svg'),
                                      height: 50,
                                    ),
                                  ),
                                  onTap: () {
                                    //loginUserWithGoogle(context);
                                  },
                                )))
                      ]))
            ]))));
  }
}

/*Future<void> loginUserWithGoogle(BuildContext context) async {
  try {
    // Вызов функции loginUserGoogle из QLHelper
    await SQLHelper.loginUserGoogle();

    // Дополнительная логика после успешного входа через Google, если необходимо

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Пользователь успешно вошел через google!'),
    ));
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Ошибка: $error'),
    ));
  }
}*/
