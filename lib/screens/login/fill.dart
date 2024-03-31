import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:service_app/date_picker/date_field.dart';
import 'package:service_app/sqlFunc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FillPage extends StatefulWidget {
  const FillPage({super.key});
  @override
  _FillPageState createState() => _FillPageState();
}

class _FillPageState extends State<FillPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ColorfulSafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 10, left: 2),
                        child: IconButton(
                            onPressed: () {} /*{GoRouter.of(context).pop()}*/,
                            icon: Transform.flip(
                                flipX: true,
                                child: SvgPicture.asset('icons/Marker.svg',
                                    color: Colors.black, height: 25)))),
                    Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Заполнить профиль',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ))
                  ]),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                      child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 56,
                        backgroundImage: Image.asset(
                          'icons/User2.png',
                        ).image,
                        backgroundColor: bgDarkColor,
                      ),
                      Positioned(
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'icons/Картинка.svg',
                            color: iconColor,
                            height: 30,
                          ),
                          onPressed: () {},
                        ),
                        bottom: -10,
                        left: 75,
                      )
                    ],
                  ))),
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
                      Expanded(
                          child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.grey[200],
                        child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Имя',
                            )),
                      ))
                    ],
                  )),
              Container(
                  height: 54,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 23),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.grey[200],
                        child: TextField(
                            controller: surnameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Фамилия',
                            )),
                      ))
                    ],
                  )),
              Container(
                  height: 54,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 23),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.grey[200],
                        child: DateFormatField(
                            type: DateFormatType.type2,
                            onComplete: (date) {
                              if (date != null) {
                                setState(() {
                                  selectedDate = date!;
                                });
                              }
                            },
                            controller: dateController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Дата рождения',
                            )),
                      ))
                    ],
                  )),
              Container(
                  height: 54,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 23),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.grey[200],
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Номер телефона',
                          ),
                          inputFormatters: [maskFormatter],
                        ),
                      ))
                    ],
                  )),
              Container(
                  height: 54,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 23),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.grey[200],
                        child: TextField(
                            controller: addressController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Адрес',
                            )),
                      )),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'icons/Геолокация.svg',
                            height: 22,
                          ),
                        ),
                      )
                    ],
                  )),
              Row(children: [
                Expanded(
                    child: Container(
                        height: 54,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 55),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Продолжить',
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
            ]))));
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);
}
