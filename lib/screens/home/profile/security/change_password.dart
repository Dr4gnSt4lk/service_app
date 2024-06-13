import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _rememberMeCheck = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {
                context.goNamed('Security');
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
              'Безопасность',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ColorfulSafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Image.network(
                        'https://cdn.donmai.us/original/4c/42/__archer_fate_and_1_more_drawn_by_ddal__4c420f30c5946409f4ff6ac6350fc9f7.jpg',
                        height: 350,
                      ),
                      PasswordField(label: 'Создать новый пароль'),
                      PasswordField(label: 'Повторить новый пароль'),
                      SizedBox(height: 5),
                      RememberMeButton(),
                      SizedBox(height: 25),
                      ContinueButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      if (isLoading) LoadingScreen(),
    ]);
  }

  Padding ContinueButton() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(400, 60),
            backgroundColor: SoftColorPurple,
          ),
          child: Text(
            'Продолжить',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 240, 232, 252),
            ),
          ),
          onPressed: () async {
            setState(() => isLoading = true);
            //call server API
            await Future.delayed(const Duration(seconds: 3));
            setState(() => isLoading = false);
            context.goNamed('Profile');
          },
        ));
  }

  Widget RememberMeButton() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 70),
        child: ListTileTheme(
            horizontalTitleGap: 0,
            child: CheckboxListTile(
              value: _rememberMeCheck,
              onChanged: (bool? value) {
                setState(() {
                  _rememberMeCheck = value!;
                });
              },
              title: Text(
                'Запомнить меня',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: MainColorPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0), // Optionally
              ),
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            )));
  }
}

class PasswordField extends StatefulWidget {
  final String label;

  PasswordField({required this.label});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 22, right: 22, top: 25),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(width: 1, color: Color(0xFFF5F5F5)),
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextField(
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: widget.label,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: SoftColorPurple,
                  )),
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _toggle,
              ),
            ),
          ),
        ));
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1000,
        height: 1000,
        color: Color.fromARGB(136, 0, 0, 0),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://cdn.donmai.us/original/4c/42/__archer_fate_and_1_more_drawn_by_ddal__4c420f30c5946409f4ff6ac6350fc9f7.jpg',
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  'Поздравляем!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: SoftColorPurple,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                    'Ваш аккаунт готов к использованию. Через несколько секунд вы будете перенаправлены на главную страницу.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      overflow: TextOverflow.visible,
                    )),
                SizedBox(height: 20),
                SpinKitCircle(
                  size: 80,
                  color: SoftColorPurple,
                )
              ],
            ),
          ),
        ));
  }
}


// void showLoadingDialog(BuildContext context) {
//   showGeneralDialog(
//     context: context,
//     barrierDismissible: false,
//     barrierLabel: "Loading",
//     pageBuilder: (context, _, __) {
//       return LoadingScreen();
//     },
//   );
// }
