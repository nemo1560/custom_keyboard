import 'package:custom_keyboard/keyboard/iKeyboardController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'keyboardEntity.dart';

class KeyBoardController extends GetxController with StateMixin implements IKeyBoardController{

  @override
  late RxList<KeyBoardEntity> lst;

  @override
  late KeyBoardEntity itemSelected;

  @override
  Future<void> onChangeValue({required String value, required bool add}) async {
    String temp = itemSelected.value.text;
    bool eDotCharacter = false;
    try{
      if (add) {
        if(value != "."){
          temp = temp + value;
          itemSelected.value.text = temp;
        }else{
          List<String> lstCharacter = temp.split("");
          if(lstCharacter.length != 0){
            for(String chac in lstCharacter){
              if(chac == "."){
                eDotCharacter = true;
                break;
              }
            }
            if(!eDotCharacter){
              temp = temp + value;
              itemSelected.value.text = temp;
            }else{
              itemSelected.value.text = temp;
            }
          }else{
            itemSelected.value.text = "0"+value;
          }
        }
      } else {
        if (temp.length > 0) {
          temp = temp.substring(0, temp.length - 1);
          itemSelected.value.text = temp;
        }
      }
    }catch(ex){
      itemSelected.value.text = "";
    }
  }

  @override
  Future<void> setItemSelected({required int currentIndex, required bool next}) async {
    // demo
    this.itemSelected = this.lst[currentIndex];
    for (KeyBoardEntity item in lst) {
      if (item.title == itemSelected.title) {
        item.select.value = true;
      } else {
        item.select.value = false;
      }
    }
  }
}