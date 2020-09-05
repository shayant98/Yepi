import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yepi/ui/dumb_widgets/title_widget.dart';

import 'package:yepi/ui/views/events/events_viewmodel.dart';

class EventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventsViewModel>.reactive(
      builder: (context, model, child) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(
                title: "Events",
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Registered groups",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF6B8F71),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 8,
                                  right: 8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Group Name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "Group description",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.event_available),
                                          onPressed: () {})
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (_, index) => SizedBox(
                          width: 20,
                        ),
                    itemCount: 3),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "All groups",
                style: TextStyle(
                    fontSize: 20,
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
                  initialCalendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
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
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => EventsViewModel(),
    );
  }
}
