import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
                  itemBuilder: (_, index) => Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      maxRadius: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Title",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    icon: Icon(Icons.more_vert),
                                    color: Color(0xFF6B8F71),
                                    onPressed: () {})
                              ],
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur scelerisque dapibus rutrum. Pellentesque maximus, risus eu euismod feugiat, justo nisi porta massa, non sollicitudin sapien ipsum et mauris. Vivamus vel feugiat neque, tempor ultrices ante. Aenean venenatis ultrices velit, at malesuada massa volutpat in. Pellentesque id est et eros dapibus maximus eget euismod mi. In volutpat vehicula lectus sed mollis. Duis semper mi eu ornare congue. Etiam eget aliquam purus, et fringilla justo. Cras id dapibus quam, vitae commodo tellus. Etiam a consequat odio. Sed at commodo odio. Interdum et malesuada fames ac ante ipsum primis in faucibus.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )),
                  separatorBuilder: (_, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: 3),
            )
          ],
        ),
      ),
      viewModelBuilder: () => DiaryViewModel(),
    );
  }
}
