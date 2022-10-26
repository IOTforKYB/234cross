import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentLayoutView extends StatelessWidget {
  final Widget? contentWidget;
  final Widget? leftMenu;

  const ContentLayoutView({this.contentWidget, this.leftMenu});

  Widget menu(String menu, Function onTap) {
    return InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            menu,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: const EdgeInsets.all(7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(child: contentWidget),
          ),
          SizedBox(width: 20),
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: 150),
              child: Container(
                child: leftMenu,
              ))
        ],
      ),
    );
  }
}
