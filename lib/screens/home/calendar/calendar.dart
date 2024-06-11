import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:service_app/constants.dart';
import 'package:service_app/screens/home/calendar/event.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            'Мой Календарь',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Container(),
          ),
        ),
        body: ColorfulSafeArea(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              margin: EdgeInsets.only(left: 18, right: 18, top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.purple[50],
              ),
              child: TableCalendar(
                shouldFillViewport: true,
                locale: 'ru_RU',
                headerStyle: HeaderStyle(
                    titleTextFormatter: (date, locale) {
                      var formattedDate = DateFormat.yMMMM(locale).format(date);
                      return formattedDate[0].toUpperCase() +
                          formattedDate.substring(1);
                    },
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2030, 1, 1),
                onDaySelected: _onDaySelected,
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
            ),
            _buildBody()
          ],
        ))));
  }

  Widget _buildBody() {
    if (_selectedDay!.day == DateTime.now().day - 2 &&
        _selectedDay!.month == DateTime.now().month &&
        _selectedDay!.year == DateTime.now().year) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(left: 18, top: 20, bottom: 10),
          child: Text(
            'Забронированные услуги (1)',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        Completed()
      ]);
    } else if (_selectedDay!.day == DateTime.now().day + 3 &&
        _selectedDay!.month == DateTime.now().month &&
        _selectedDay!.year == DateTime.now().year) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(left: 18, top: 20, bottom: 10),
          child: Text(
            'Забронированные услуги (2)',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        Upcoming()
      ]);
    } else {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(left: 18, top: 20, bottom: 90),
          child: Text(
            'Забронированные услуги (0)',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
            child: Column(children: [
          Text(
            'Нет забронированных услуг',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Вы не бронировали услуг на эту дату',
            style: TextStyle(fontSize: 15),
          )
        ]))
      ]);
    }
  }

  Widget Upcoming() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 20, 9, 20),
                  child: Container(
                      height: 115,
                      width: 115,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        'jobs/${jobs[4]}',
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 9, 20),
                  child: Container(
                    height: 115,
                    width: 150,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            width: 150,
                            child: Text(
                              'Уборка квартир',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            child: Container(
                          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                          width: 150,
                          child: Text(
                            'Елена Кузнецова',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 16, 50, 0),
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: SoftColorPurple,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Предстоящее',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 20, 9, 20),
                  child: Container(
                      height: 115,
                      width: 115,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        'jobs/${jobs[1]}',
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 9, 20),
                  child: Container(
                    height: 115,
                    width: 150,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            width: 150,
                            child: Text(
                              'Визажист',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            child: Container(
                          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                          width: 150,
                          child: Text(
                            'Мария Петрова',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 16, 50, 0),
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: SoftColorPurple,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Предстоящее',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Widget Completed() {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 20, 9, 20),
                child: Container(
                    height: 115,
                    width: 115,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      'jobs/${jobs[0]}',
                      fit: BoxFit.fill,
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 9, 20),
                child: Container(
                  height: 115,
                  width: 150,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          width: 150,
                          child: Text(
                            'Тех. осмотр авто',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                          child: Container(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        width: 150,
                        child: Text(
                          'Алексей Смирнов',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 50, 0),
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Выполнено',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
    ]);
  }
}
