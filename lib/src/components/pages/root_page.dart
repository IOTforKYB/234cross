import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whereyousick_admin/src/components/pages/test.dart';
import 'package:whereyousick_admin/src/controller/ScreenLayoutController.dart';

import '../../controller/menuController.dart';

String chosenMenu = '';

class NavigationMenu extends GetView<ScreenLayoutController> {
  ScreenSizeType screenSizeType;
  NavigationMenu(this.screenSizeType);

  Widget menu(String menu, Function onTap, double btnSize) {
    final mContoller = Get.put(menuController());
    return Container(
        child: TextButton(
            onPressed: () {
              mContoller.getMenu(menu);
              chosenMenu = menu;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                menu,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "aggro",
                  fontSize: btnSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )));
  }

  Widget _miniLayout(double fontSize) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 5, color: Colors.black)),
          child: Row(
            children: [
              menu("일정 조회", () {}, fontSize),
              menu("환자 조회", () {}, fontSize),
              menu("병상 조회", () {}, fontSize),
              menu("공지사항", () {}, fontSize),
            ],
          ));
    });
  }

  Widget _fullLayout(double fontsize) {
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
                menu("일정 조회", () {}, fontsize),
                menu("환자 조회", () {}, fontsize),
                menu("병상 조회", () {}, fontsize),
                menu("공지사항", () {}, fontsize),
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
        return _miniLayout(20);
        break;
      case ScreenSizeType.Full:
        return _fullLayout(32);
        break;
    }
  }
}

String makeRequire() {
  DateTime now = DateTime.now();
  int requireId = 1;
  String name = "김용범"; // 변수로 바꿔서 입력값들 넣기
  String bed = "B1";
  String requiredItem = "진통제";
  String requiredTime = DateFormat('MM/dd-HH:mm').format(now);
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

List deleteList() {
  List<String> itemList = [];
  //itemList.removeAt(makeRequire().toString());
  return itemList;
}

class RootPage extends GetView<ScreenLayoutController> {
  final listController = TextEditingController();
  final ScreenSizeType screenSizeType;
  static RootPage get to => Get.find();
  RootPage(this.screenSizeType);
  final ScrollController scrollController = ScrollController();

  Widget _contents() {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 5, color: Colors.black)),
        child: GetBuilder<menuController>(builder: (controller) {
          return Column(
            children: [
              Text(
                "${chosenMenu}",
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
              if (chosenMenu == '환자 조회')
                searchPatient()
              else if (chosenMenu == '일정 조회')
                searchPatient()
              else if (chosenMenu == '병상 조회')
                searchPatient()
              else if (chosenMenu == '공지사항')
                searchPatient()
            ],
          );
        }));
  }

  Widget searchPatient() {
    final inputController = TextEditingController();
    return Container(
        child: Column(
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: inputController,
                  onSubmitted: (value) {
                    //서버로 보내서 return select * from patient where name = value
                    print(value);
                  },
                  onChanged: (value) {},
                  decoration: InputDecoration(labelText: "환자 이름을 입력하세요."),
                  autofocus: true,
                  style: TextStyle(
                      fontFamily: 'aggro',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              OutlinedButton(
                onPressed: () => print('${inputController.text}'),
                /* 빨간색 글씨 서버로 보내서 return select * from patient where name = 빨간색 글씨*/
                child: Text(
                  '검색',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'aggro',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  child: Text(makeList()[index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontFamily: "aggro", fontSize: 20),
                      textAlign: TextAlign.center),
                ),
                TextButton(
                    onPressed: () {
                      //DB에 있는 클릭된 개체 삭제

                      print(makeList());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '완료',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "aggro",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
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
        child: Column(
          children: [
            Flexible(flex: 2, child: NavigationMenu(screenSizeType)),
            Flexible(
              flex: 9,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 5, color: Colors.black)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "환자 요청 사항",
                              style:
                                  TextStyle(fontFamily: "aggro", fontSize: 32),
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
                  SizedBox(width: 15),
                  Flexible(flex: 1, child: _contents()),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.Mini:
        return _fullLayout();
        break;
      case ScreenSizeType.Full:
        return _fullLayout();
        break;
    }
  }
}
