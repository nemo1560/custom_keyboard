import 'package:custom_keyboard/binding/homeBinding.dart';
import 'package:custom_keyboard/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    getPages: [
      GetPage(name: "/", page: ()=> Home(),binding: HomeBinding()),
    ],));
}

