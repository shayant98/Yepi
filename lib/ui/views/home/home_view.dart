import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yepi/ui/dumb_widgets/title_widget.dart';
import 'package:yepi/ui/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              TitleWidget(
                title: "Welcome",
              ),
              SizedBox(
                height: 20,
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
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
