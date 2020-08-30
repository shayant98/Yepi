import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yepi/ui/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          toolbarOpacity: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Color(0xFF1B4079),
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Text(
                          "Shayant Sital",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Mood board",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TableCalendar(
                    calendarController: model.calendarController,
                    initialCalendarFormat: CalendarFormat.twoWeeks,
                    calendarStyle: CalendarStyle(
                      highlightToday: false,
                      outsideDaysVisible: false,
                      weekendStyle: TextStyle(
                        color: Colors.black,
                      ),
                      weekdayStyle: TextStyle(
                        color: Colors.black,
                      ),
                      renderDaysOfWeek: false,
                      outsideWeekendStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      formatButtonShowsNext: false,
                      centerHeaderTitle: true,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2E4057),
          onPressed: () {},
          tooltip: 'Add Entry',
          child: Icon(
            Icons.add,
            color: Theme.of(context).backgroundColor,
          ),
          elevation: 2.0,
        ),
        bottomNavigationBar: BottomNav(),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: CircularNotchedRectangle(),
      child: BottomNavigationBar(
        elevation: 4,
        backgroundColor: Color(0xFF6B8F71),
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("Events"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Support"),
          ),
        ],
      ),
    );
  }
}
