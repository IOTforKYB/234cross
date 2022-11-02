import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class menuController extends GetxController {
  String clickMenu = '';

  void getMenu(String menu) {
    clickMenu = menu;
    update();
  }
}
