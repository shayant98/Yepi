import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yepi/ui/views/diary/diary_view.dart';
import 'package:yepi/ui/views/events/events_view.dart';
import 'package:yepi/ui/views/home/home_view.dart';
import 'package:yepi/ui/views/parent/parent_viewmodel.dart';

class ParentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ParentViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {},
              color: Colors.black,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: getViewForIndex(model.currentIndex),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          heroTag: 'add-post',
          backgroundColor: Color(0xFF2E4057),
          onPressed: () => model.navigateToPostPage(),
          tooltip: 'Add Entry',
          child: Icon(
            Icons.add,
            color: Theme.of(context).backgroundColor,
          ),
          elevation: 2.0,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            elevation: 4,
            backgroundColor: Color(0xFF6B8F71),
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                title: Text("Diary"),
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
        ),
      ),
      viewModelBuilder: () => ParentViewModel(),
    );
  }
}

// ignore: missing_return
Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return HomeView();
    case 1:
      return DiaryView();
    case 2:
      return EventsView();
  }
}
