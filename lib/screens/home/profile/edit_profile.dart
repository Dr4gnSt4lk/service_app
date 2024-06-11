import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';
import 'package:intl/intl.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd.MM.yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {
                context.goNamed('Profile');
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
              'Профиль',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ColorfulSafeArea(
            child: ListView(
          children: <Widget>[
            SizedBox(height: 25),
            TextBuilder("ФИО", "Игорь Пирожков", false),
            //TextBuilder("Ник", "Игорян"),
            DateSelection(context),

            TextBuilder("Почта", "yllya_prudenko@gmail.com", false),
            TextBuilder("Номер Телефона", "+74083756988", true),
            GenderSelection(),
            TextBuilder("Адрес", "Пр. Строителей 108а кв. 46", false),

            UpdateButton(context),
          ],
        )));
  }

  Padding TextBuilder(String labelText, String placeholder, bool OnlyNumbers) {
    return Padding(
      padding: EdgeInsets.only(left: 22, right: 22, bottom: 25),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(width: 1, color: Color(0xFFF5F5F5)),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          keyboardType: OnlyNumbers
              ? TextInputType.phone
              : null, //Проверка на использование ТОЛЬКО ЦИФР
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
          decoration: InputDecoration(
            //ooooooooooooo
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: SoftColorPurple,
                )),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25),
            ),
            labelText: labelText,
            labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 0, 0.791)),
          ),
        ),
      ),
    );
  }

  Padding GenderSelection() {
    return Padding(
        padding: EdgeInsets.only(left: 22, right: 22, bottom: 35),
        child: Container(
            height: 65,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(width: 1, color: Color(0xFFF5F5F5)),
              borderRadius: BorderRadius.circular(25),
            ),
            child: DropdownButtonFormField(
              icon: Padding(
                padding: EdgeInsets.only(right: 5),
                child: SvgPicture.asset(
                  'icons/Стрелка вниз.svg',
                ),
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
                labelText: 'Выберите Пол',
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Пол',
                hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 0.791)),
              ),
              items: const [
                DropdownMenuItem(
                    child: Text(
                      'Мужской',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    value: '0'),
                DropdownMenuItem(
                    child: Text(
                      'Женский',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    value: '1')
              ].toList(),
              onChanged: (v) {},
            )));
  }

  Padding DateSelection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22, right: 22, bottom: 25),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(width: 1, color: Color(0xFFF5F5F5)),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          controller: _dateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
          decoration: InputDecoration(
            //ooooooooooooo

            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25),
            ),
            labelText: 'Дата Рождения',
            labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: _selectedDate != null
                ? DateFormat('dd.MM.yyyy').format(_selectedDate!)
                : '26.06.2003',
            hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 0, 0.791)),
          ),
        ),
      ),
    );
  }

  Padding UpdateButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(22, 25, 22, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: SoftColorPurple,
            backgroundColor: SoftColorPurple,
            fixedSize: Size(180, 60),
          ),
          child: Text(
            'Обновить',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 240, 232, 252),
            ),
          ),
          onPressed: () {
            context.goNamed('Profile');
          },
        ));
  }
}
