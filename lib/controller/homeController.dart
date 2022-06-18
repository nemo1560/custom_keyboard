import 'package:custom_keyboard/home.dart';
import 'package:custom_keyboard/keyboard/iKeyboardController.dart';
import 'package:custom_keyboard/keyboard/keyboardEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController with StateMixin, IKeyBoardController{
  late IKeyBoardController callback;
  late KeyBoardEntity itemSelected;
  RxInt index = 0.obs;
  RxList<KeyBoardEntity> lst = <KeyBoardEntity>[].obs;
  HomeController({required this.callback});

  @override
  void onInit() {
    int i = 0;
    while (i < 11) {
      lst.add(new KeyBoardEntity(
          title: i.toString(),
          value: new TextEditingController(),
          select: false.obs));
      i++;
    }
    itemSelected = lst.first;
    itemSelected.select = true.obs;
    change(null, status: RxStatus.success());
    super.onInit();
  }


  @override
  Future<void> setItemSelected({required int currentIndex, required bool next}) async {
    callback.lst = lst;
    //set new index selected item;
    this.index.value = currentIndex;
    if(next){
      this.index++;
      if (index > lst.length) {
        index.value = 0;
      }
    }
    await callback.setItemSelected(currentIndex: index.value,next: next);
    change(null,status: RxStatus.success());
  }

  @override
  Future<void> onChangeValue({required String value, required bool add}) async {
    //set itemSelected to callback
    callback.itemSelected = this.lst[index.value];
    await callback.onChangeValue(value: value, add: add);
    change(null,status: RxStatus.success());

  }
}


