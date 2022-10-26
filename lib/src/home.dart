import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/navigation_menu.dart';

class mainPage extends StatelessWidget {
  const mainPage();

  Widget _contents() {
    return Placeholder(
      fallbackHeight: 80,
    );
  }

  Widget _footer() {
    return Placeholder(
      fallbackHeight: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [NavigationMenu(), Expanded(child: _contents()), _footer()],
      ),
    ));
  }
}
