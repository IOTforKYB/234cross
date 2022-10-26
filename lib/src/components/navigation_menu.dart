import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu();

  Widget menu(String menu, Function onTap) {
    return Container(
        child: InkWell(
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
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              menu("환자 조회", () {}),
              menu("병상 조회", () {}),
              menu("공지 사항", () {}),
            ],
          )
        ],
      ),
    );
  }
}
