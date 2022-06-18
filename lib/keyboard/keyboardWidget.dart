import 'package:custom_keyboard/controller/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyBoardWidget {
  static Widget keyboard({required BuildContext context,required HomeController controller}) {
    return IntrinsicHeight(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    KeyBoardWidget.buttonItem(controller: controller, value: '1', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller,value: '2', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '3', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '', next: false, del: true),
                  ],
                ),
                Row(
                  children: [
                    KeyBoardWidget.buttonItem(controller: controller, value: '4', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '5', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '6', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '', next: false, del: false),
                  ],
                ),
                Row(
                  children: [
                    KeyBoardWidget.buttonItem(controller: controller, value: '7', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '8', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '9', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '', next: false, del: false),
                  ],
                ),
                Row(
                  children: [
                    KeyBoardWidget.buttonItem(controller: controller, value: '.', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '0', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '', next: false, del: false),
                    KeyBoardWidget.buttonItem(controller: controller, value: '', next: true, del: false),
                  ],
                ),
              ],
            )));
  }

  static Widget buttonItem(
      {required HomeController controller, required String value, required bool next, required bool del}) {
    return Expanded(
        child: InkWell(
          child: Container(
              height: 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  border: Border.all(color: Colors.grey)),
              child: next && !del
                  ? Icon(
                Icons.navigate_next_sharp,
                size: 30,
              )
                  : !next && del
                  ? Icon(
                Icons.arrow_back,
                size: 25,
              )
                  : Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )),
          onTap: () {
            if (next) {
              controller.setItemSelected(currentIndex: controller.index.value,next: next);
            } else if (del) {
              controller.onChangeValue(value: '', add: false);
            } else {
              value.isNotEmpty
                  ? controller.onChangeValue(value: value.toString(), add: true)
                  : null;
            }
          },
        ));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
