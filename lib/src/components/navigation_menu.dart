import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu();
  final ScrollController scrollController = ScrollController();

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
                  fontFamily: "aggro",
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 5, color: Colors.black)),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                menu("환자 조회", () {}),
                menu("병상 조회", () {}),
                menu("공지사항", () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
