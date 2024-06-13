import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/constants.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Transform.flip(
            flipX: true,
            child: SvgPicture.asset(
              'icons/Marker.svg',
              color: Colors.black,
              height: 25,
            ),
          ),
        ),
        titleSpacing: 0,
        title: Text(
          'Записи',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // GoRouter.of(context).pop();
            },
            icon: SvgPicture.asset(
              'icons/Пуппа.svg',
              height: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              // GoRouter.of(context).pop();
            },
            icon: SvgPicture.asset(
              'icons/3 точки.svg',
              height: 25,
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Предстоящие'),
            Tab(text: 'Выполнено'),
            Tab(text: 'Отменено'),
          ],
          indicatorColor: SoftColorPurple,
          labelColor: SoftColorPurple,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Upcoming(),
          Completed(),
          Canceled(),
        ],
      ),
    );
  }

  Widget Upcoming() {
    if (jobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/no_jobs.png', // Замените на ваш путь к изображению
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'No jobs available yet',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      );
    } else {
      return ListView(
        children: [
          UpcomingBigCard(
            image: 'jobs/${jobs[4]}',
            job: 'Уборка квартир',
            name: 'Елена Кузнецова',
            date: '25 Декабря | 12:00 - 16:00',
            location: 'ул. Пушкина, д. Калатушкина',
          ),
          UpcomingBigCard(
            image: 'jobs/${jobs[2]}',
            job: 'Стрижка',
            name: 'Андрей Минько',
            date: '22 Декабря | 11:00 - 18:00',
            location: 'пр. Строителей, д. 108-а кв. 54',
          ),
          UpcomingBigCard(
            image: 'jobs/${jobs[7]}',
            job: 'Доставка',
            name: 'Какой-то Мужик',
            date: '26 Июня | 07:00 - 12:00',
            location: 'ул. Хрен Знает, д. Сам придумай, кв. 12',
          ),
          UpcomingBigCard(
            image: 'jobs/${jobs[7]}',
            job: 'Доставка',
            name: 'Какой-то Мужик',
            date: '26 Июня | 07:00 - 12:00',
            location: 'ул. Хрен Знает, д. Сам придумай, кв. 12',
          ),
        ],
      );
    }
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

  Widget Canceled() {
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

class UpcomingBigCard extends StatefulWidget {
  final String image;
  final String job;
  final String name;
  final String date;
  final String location;

  UpcomingBigCard({
    required this.image,
    required this.job,
    required this.name,
    required this.date,
    required this.location,
  });

  @override
  _UpcomingBigCardState createState() => _UpcomingBigCardState();
}

class _UpcomingBigCardState extends State<UpcomingBigCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: _isExpanded ? 530 : 190,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 20, 9, 20),
                    child: Container(
                      height: 115,
                      width: 115,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.fill,
                      ),
                    ),
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
                                widget.job,
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
                                widget.name,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
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
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(50, 117, 105, 182),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'icons/Бабл.svg',
                          color: SoftColorPurple,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
              if (_isExpanded)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                          child: Row(
                            children: [
                              Text(
                                'Время и Дата',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                widget.date,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: const Color.fromARGB(184, 0, 0, 0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                          child: Row(
                            children: [
                              Text(
                                'Место',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                widget.location,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: const Color.fromARGB(184, 0, 0, 0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                          child: Image.network(
                            'https://cdn.discordapp.com/attachments/638347228917923880/1250772683277467738/b96da73938d98e49.png?ex=666c2855&is=666ad6d5&hm=b7b571e050962ce607bfceed0beec33e7e769afd46fe6646985d3d97d365d396&',
                            height: 200,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                          child: Row(
                            children: [
                              OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    surfaceTintColor: SoftColorPurple,
                                    fixedSize: Size(170, 40),
                                    side: BorderSide(
                                      width: 3,
                                      color: SoftColorPurple,
                                    )),
                                child: Text(
                                  'Отменить',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: SoftColorPurple,
                                  ),
                                ),
                                onPressed: () {
                                  Cancel(context);
                                },
                              ),
                              Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: SoftColorPurple,
                                  fixedSize: Size(170, 40),
                                ),
                                child: Text(
                                  'Квитанция',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 240, 232, 252),
                                  ),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: _isExpanded
                    ? SvgPicture.asset('icons/Стрелка вверх.svg')
                    : SvgPicture.asset('icons/Стрелка вниз.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Cancel(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 340,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    'Отменить Запись',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Вы уверены, что хотите отменить вашу запись?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Text(
                    'По нашему лицензионному соглашению Вы сможете вернуть только 80% от стоимости услуги',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.visible),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(180, 60),
                          foregroundColor: SoftColorPurple,
                          backgroundColor: Color.fromARGB(255, 240, 232, 252),
                        ),
                        child: Text(
                          'Отменить',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: MainColorPurple,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(180, 60),
                            foregroundColor: Color.fromARGB(255, 240, 232, 252),
                            backgroundColor: MainColorPurple),
                        child: Text(
                          'Да',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
