import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;

  const FlatButtonWidget({Key key, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => onPressed(),
      child: Text(
        title ?? "",
        style: TextStyle(color: Colors.white),
      ),
      color: Color(0xFF6B8F71),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
