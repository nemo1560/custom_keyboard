import 'package:custom_keyboard/controller/homeController.dart';
import 'package:custom_keyboard/keyboard/iKeyboardController.dart';
import 'package:custom_keyboard/keyboard/keyboardController.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IKeyBoardController>(() => KeyBoardController());
    Get.lazyPut(() => HomeController(callback: Get.find()));
  }

}