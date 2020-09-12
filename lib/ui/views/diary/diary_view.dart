import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yepi/ui/dumb_widgets/post_container.dart';
import 'package:yepi/ui/dumb_widgets/title_widget.dart';
import 'package:yepi/ui/views/diary/diary_viewmodel.dart';

class DiaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DiaryViewModel>.reactive(
      builder: (context, model, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
              title: "Diary",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                IconButton(icon: Icon(Icons.filter_list), onPressed: () {})
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index) => PostWidget(post: model.data[index],),
                  separatorBuilder: (_, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: model.data.length),
            )
          ],
        ),
      ),
      viewModelBuilder: () => DiaryViewModel(),
    );
  }
}
