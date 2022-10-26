import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whereyousick_admin/src/components/pages/footerPage.dart';
import 'package:whereyousick_admin/src/components/pages/root_page.dart';

import 'components/navigation_menu.dart';
import 'components/ContentLayoutView.dart';

class mainPage extends StatelessWidget {
  const mainPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [NavigationMenu(), Expanded(child: RootPage()), footer()],
      ),
    ));
  }
}
