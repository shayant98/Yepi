import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yepi/models/mood_model.dart';
import 'package:yepi/ui/dumb_widgets/title_widget.dart';
import 'package:yepi/ui/views/home/home_viewmodel.dart';
import 'package:yepi/utils/date_util.dart';

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
                child: (!model.dataReady)
                    ? CircularProgressIndicator()
                    : TableCalendar(
                        calendarController: model.calendarController,
                        initialCalendarFormat: CalendarFormat.twoWeeks,
                        builders: CalendarBuilders(
                            markersBuilder: (_, date, events, holidays) {
                          final children = <Widget>[];

                          if (events.isNotEmpty) {
                            children.add(
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Color(0xFF2E4057),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            );
                          }

                          return children;
                        }, selectedDayBuilder: (_, date, events) {
                          return Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xFF6B8F71),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${date.day}',
                                  style: TextStyle().copyWith(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        }),
                        onDaySelected: (date, events) {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(
                                  "On ${DateUtil().formatDate(dateTime: date, format: 'd MMMM, yyyy')} you felt:"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              content: SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.sentiment_satisfied,
                                      size: 74,
                                      color: Color(0xFF6B8F71),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            barrierDismissible: true,
                          );
                        },
                        events: model.moodMap,
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
      onModelReady: (model) => model.init(),
    );
  }
}
