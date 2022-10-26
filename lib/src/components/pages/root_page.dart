import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage();

  Widget _contents() {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 5, color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                'Contrary to popular belief, Lorem Ipsum is not simply random text.',
                style: TextStyle(
                    fontFamily: 'aggro',
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Text(
                'Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text.',
                style: TextStyle(fontFamily: 'aggro', fontSize: 16)),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 5, color: Colors.black)),
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "디자인 어케 하는게 좋을까 머리가 아파용",
                      style: TextStyle(
                          fontFamily: "aggro",
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text(
                      "텍스트들 나중에 다 텍스트에어리어 입력할 수 있게 바꾸기",
                      style: TextStyle(
                          fontFamily: "aggro",
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )
                  ],
                )),
            SizedBox(width: 20),
            Expanded(child: _contents())
          ],
        ));
  }
}
