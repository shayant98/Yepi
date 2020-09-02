import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yepi/ui/views/diary/diary_view.dart';
import 'package:yepi/ui/views/events/events_view.dart';
import 'package:yepi/ui/views/home/home_view.dart';
import 'package:yepi/ui/views/parent/parent_viewmodel.dart';

class ParentView extends StatelessWidget {
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ParentViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        key: scaffoldState,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: getViewForIndex(model.currentIndex),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2E4057),
          onPressed: () => _showSheet(),
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

  void _showSheet() {
    // Show BottomSheet here using the Scaffold state instead ot«f the Scaffold context
    scaffoldState.currentState
        .showBottomSheet((context) => SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Add an entry...",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: "Message",
                          labelStyle: TextStyle(color: Color(0xFF6B8F71)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Color(0xFF6B8F71)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Switch(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Text("Public"),
                        ],
                      ),
                      FlatButton(
                        color: Color(0xFF2E4057),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        child:
                            Text("Add", style: TextStyle(color: Colors.white)),
                      ),
                      Divider(),
                      Text(
                          "* Only entries marked public are shared on the support board"),
                    ],
                  ),
                ),
              ),
            ));
  }
}

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
