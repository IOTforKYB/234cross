import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum ScreenSizeType { Mini, Full }

class ScreenLayoutController extends GetxController {
  static ScreenLayoutController get to => Get.find();
  Rx<ScreenSizeType> _screenType = ScreenSizeType.Full.obs;
  Rx<ScreenSizeType> type = ScreenSizeType.Full.obs;

  @override
  void onInit() {
    debounce(_screenType, (_) {
      type(_screenType.value);
    }, time: Duration(milliseconds: 200));
    super.onInit();
  }

  void builder(BoxConstraints constraints) {
    print(constraints.biggest.width);
    if (constraints.biggest.width <= 1500) {
      _screenType(ScreenSizeType.Mini);
    } else if (constraints.biggest.width > 1500) {
      _screenType(ScreenSizeType.Full);
    }
  }
}
