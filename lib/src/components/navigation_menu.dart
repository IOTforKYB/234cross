import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whereyousick_admin/src/components/pages/root_page.dart';
import 'package:whereyousick_admin/src/controller/ScreenLayoutController.dart';

class NavigationMenu extends GetView<ScreenLayoutController> {
  ScreenSizeType screenSizeType;
  NavigationMenu(this.screenSizeType);

  String menuClicked() {
    return "Clicked";
  }

  Widget menu(String menu, Function onTap) {
    return Container(
        child: InkWell(
            borderRadius: BorderRadius.circular(15),
            focusColor: Colors.transparent,
            mouseCursor: MaterialStateMouseCursor.clickable,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.blue,
            onTap: () {
              menuClicked();
            },
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

  Widget _miniLayout() {
    return Container();
  }

  Widget _fullLayout() {
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
                menu("일정 조회", () {
                  RootPage.to.getMenu("일정 조회");
                }),
                menu("환자 조회", () {
                  RootPage.to.getMenu("환자 조회");
                }),
                menu("병상 조회", () {
                  RootPage.to.getMenu("병상 조회");
                }),
                menu("공지사항", () {
                  RootPage.to.getMenu("공지사항");
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.Mini:
        return _miniLayout();
        break;
      case ScreenSizeType.Full:
        return _fullLayout();
        break;
    }
  }
}
