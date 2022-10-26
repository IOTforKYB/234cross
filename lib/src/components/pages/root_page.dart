import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage();

  Widget _contents() {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
            'Contrary to popular belief, Lorem Ipsum is not simply random text.',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        Text(
            'Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text.',
            style: TextStyle(fontSize: 16)),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "디자인 어케 하는게 좋을까 머리가 아파용",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      "텍스트들 나중에 다 텍스트에어리어 입력할 수 있게 바꾸기",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                )),
            SizedBox(width: 50),
            Expanded(child: _contents())
          ],
        ));
  }
}
