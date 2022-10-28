import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whereyousick_admin/src/components/navigation_menu.dart';
import 'package:whereyousick_admin/src/controller/ScreenLayoutController.dart';

String makeRequire() {
  DateTime now = DateTime.now();
  int requireId = 1;
  String name = "김용범"; // 변수로 바꿔서 입력값들 넣기
  String bed = "B1";
  String requiredItem = "진통제";
  String requiredTime = DateFormat('MM/dd(E)-HH:mm').format(now);
  String makeRequirement(String patientName, String patientLoc,
      String patientReq, String reqTime) {
    return "환자 이름 : " +
        patientName +
        ", 병상 위치 : " +
        patientLoc +
        ", 요청 사항 : " +
        patientReq +
        "\n 요청 시간 : " +
        reqTime;
  }

  return makeRequirement(name, bed, requiredItem, requiredTime);
}

List makeList() {
  List<String> itemList = [];
  itemList.add(makeRequire().toString());
  return itemList;
}

void deleteList(List itemList) {
  itemList.remove(itemList);
}

class RootPage extends StatelessWidget {
  final ScreenSizeType screenSizeType;
  static RootPage get to => Get.find();
  RootPage(this.screenSizeType);
  final ScrollController scrollController = ScrollController();

  void getMenu(String menuName) {
    //ClickedMenu = menuName;
    //return clickedMenu;
  }

  Widget _contents() {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 5, color: Colors.black)),
        child: Column(
          children: [
            Text(
              'clickedMenu',
              style: TextStyle(
                  fontFamily: 'aggro',
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height: 15),
            //박스들로 바꿔서 필요한 것들 넣기
            Text(
                'Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text.',
                style: TextStyle(fontFamily: 'aggro', fontSize: 28)),
          ],
        ));
  }

  Widget requirement() {
    return ListView.builder(
      itemCount: makeList().length,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Row(
                  children: [
                    Container(
                      child: Text(makeList()[index],
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontFamily: "aggro", fontSize: 28),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      //DB에 있는 클릭된 개체 삭제
                    },
                    icon: Icon(
                      Icons.check_circle_outlined,
                      size: 35,
                      color: Colors.blue,
                    )),
              ]),
              Divider(
                color: Colors.black,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _miniLayout() {
    return Container();
  }

  Widget _fullLayout() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 5, color: Colors.black)),
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "환자 요청 사항",
                        style: TextStyle(fontFamily: "aggro", fontSize: 32),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      //여기에 함수 추가해서 환자가 요청할 때마다 요청사항 추가하게
                      Expanded(child: requirement()),
                      Divider(
                        color: Colors.black,
                      )
                    ],
                  )),
            ),
            SizedBox(width: 20),
            Flexible(fit: FlexFit.tight, child: _contents()),
          ],
        ));
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
