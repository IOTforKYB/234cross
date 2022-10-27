import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentLayoutView extends StatelessWidget {
  final Widget? contentWidget;
  final Widget? leftMenu;

  const ContentLayoutView({this.contentWidget, this.leftMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(child: contentWidget),
          ),
          SizedBox(width: 20),
          Expanded(
              child: Container(
            child: leftMenu,
          ))
        ],
      ),
    );
  }
}
