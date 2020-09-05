import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool showProfile;
  const TitleWidget({Key key, this.title, this.showProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 5,
              decoration: BoxDecoration(
                  color: Color(0xFF1B4079),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
        (showProfile == true)
            ? IconButton(
                icon: Icon(Icons.person_outline),
                onPressed: () {},
                iconSize: 24,
                color: Color(0xFF1B4079),
              )
            : Container()
      ],
    );
  }
}
