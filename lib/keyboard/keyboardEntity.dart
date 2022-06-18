import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class KeyBoardEntity {
  late String title;
  late TextEditingController value;
  late RxBool select;

  KeyBoardEntity({required this.title, required this.value, required this.select});
}