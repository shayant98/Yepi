import 'package:flutter/material.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/models/post_model.dart';
import 'package:yepi/services/auth_service.dart';

class PostWidget extends StatelessWidget {
  final AuthService _authService = locator<AuthService>();
  final PostModel post;

  PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      backgroundImage: AssetImage(
                        "assets/img/leaf.png",
                      ),
                      maxRadius: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      post.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                (post.user == _authService.currentUser.id)
                    ? PopupMenuButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        itemBuilder: (_) {
                          List<PopupMenuItem> menuItems = [
                            PopupMenuItem(
                              value: "edit",
                              child: Text("Edit"),
                            ),
                            PopupMenuItem(
                              value: "Delete",
                              child: Row(
                                children: [
                                  Text("Remove"),
                                ],
                              ),
                            ),
                          ];
                          return menuItems;
                        },
                        onSelected: (value) {
                          print(value);
                        },
                      )
                    : Container()
              ],
            ),
            Text(
              post.body ?? "No Content",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
