import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/constants.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: widget.navigationShell,
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              textTheme:
                  GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
              _goToBranch(selectedIndex);
            },
            selectedItemColor: iconColor,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'icons/Дом.svg',
                    height: 25,
                    color: Colors.grey,
                  ),
                  activeIcon: SvgPicture.asset('icons/Дом.svg',
                      color: iconColor, height: 25),
                  label: 'Главная'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'icons/Документ.svg',
                    height: 25,
                    color: Colors.grey,
                  ),
                  activeIcon: SvgPicture.asset('icons/Документ.svg',
                      height: 25, color: iconColor),
                  label: 'Записи'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'icons/Календарь 2.svg',
                    height: 25,
                    color: Colors.grey,
                  ),
                  activeIcon: SvgPicture.asset('icons/Календарь 2.svg',
                      height: 25, color: iconColor),
                  label: 'Календарь'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'icons/Бабл.svg',
                    height: 25,
                    color: Colors.grey,
                  ),
                  activeIcon: SvgPicture.asset('icons/Бабл.svg',
                      height: 25, color: iconColor),
                  label: 'Сообщения'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'icons/Профиль.svg',
                    height: 25,
                    color: Colors.grey,
                  ),
                  activeIcon: SvgPicture.asset('icons/Профиль.svg',
                      height: 25, color: iconColor),
                  label: 'Профиль'),
            ],
          ),
        ));
  }
}
