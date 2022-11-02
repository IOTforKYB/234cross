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
      child: Row(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(child: contentWidget),
            ),
            Flexible(flex: 1, child: Container(child: leftMenu))
          ],
        ),
      ]),
    );
  }
}
