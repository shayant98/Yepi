import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  final String title;
  final onPressed;
  final bool isBusy;

  const FlatButtonWidget({Key key, this.title, this.onPressed, this.isBusy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: (isBusy)
          ? SizedBox(
              height: 23,
              width: 23,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              title ?? "",
              style: TextStyle(color: Colors.white),
            ),
      color: Color(0xFF6B8F71),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
