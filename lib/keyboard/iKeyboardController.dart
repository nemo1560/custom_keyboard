import 'package:custom_keyboard/keyboard/keyboardEntity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class IKeyBoardController{
  late KeyBoardEntity itemSelected;
  RxList<KeyBoardEntity> lst = <KeyBoardEntity>[].obs;
  Future<void> setItemSelected({required int currentIndex, required bool next});
  Future<void> onChangeValue({required String value, required bool add});
}