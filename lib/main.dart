import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whereyousick_admin/src/controller/ScreenLayoutController.dart';
import 'package:whereyousick_admin/src/home.dart';

void main() {
  runApp(const whereyouSick());
}

class whereyouSick extends StatelessWidget {
  const whereyouSick({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'whereyouSick',
      initialBinding: BindingsBuilder(() {
        Get.put(ScreenLayoutController());
      }),
      //theme: ThemeData(primarySwatch: Colors.blue),
      home: mainPage(),
    );
  }
}
