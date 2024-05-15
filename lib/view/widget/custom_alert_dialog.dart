import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.buttonTitle,
      this.icon});
  final Icon? icon;
  final String title;
  final String content;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Icon(Icons.check_circle, color: Colors.green),
          icon ?? SizedBox(),
          SizedBox(height: icon != null ? 10 : 0),
          Text(title),
        ],
      ),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(buttonTitle),
        ),
      ],
    );
  }
}
