import 'dart:ffi';

import 'package:custom_keyboard/controller/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'keyboard/keyboardWidget.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Scaffold(
                body: Container(
              height: Get.height,
              width: Get.width,
              color: Colors.deepPurple.shade100,
              child: Column(
                children: [
                  Expanded(child: body(context)),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: KeyBoardWidget.keyboard(context: context,controller: controller)),
                ],
              ),
            )),
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) => Text(error!));
  }

  Widget body(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      margin: EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: controller.lst.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 70,
            color: Colors.grey.shade100,
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Expanded(child: Text(controller.lst[index].title)),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            border: controller.lst[index].select.value == true
                                ? Border.all(color: Colors.red)
                                : null),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            controller.setItemSelected(currentIndex: index,next: false);
                          },
                          autofocus: true,
                          focusNode: AlwaysDisabledFocusNode(),
                          controller: controller.lst[index].value,
                        ))),
              ],
            ),
          );
        },
      ),
    );
  }



}

