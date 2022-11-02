import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whereyousick_admin/src/components/pages/footerPage.dart';
import 'package:whereyousick_admin/src/components/pages/root_page.dart';
import 'package:get/get.dart';
import 'package:whereyousick_admin/src/controller/ScreenLayoutController.dart';
import 'components/ContentLayoutView.dart';

class mainPage extends StatelessWidget {
  const mainPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            ScreenLayoutController.to.builder(constraints);
            return Container();
          },
        ),
        Obx(() => Container(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 600),
                child: Column(children: [
                  Expanded(
                      child: RootPage(ScreenLayoutController.to.type.value)),
                  footer()
                ]),
              ),
            ))
      ],
    ));
  }
}
