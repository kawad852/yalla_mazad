import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSize{
  static double phoneSize(double hardSize, {required bool height}) {
    double res;
    if (height) {
      double temp = 926 / hardSize;
      res = MediaQuery.of(Get.context!).size.height / temp;
    } else {
      double temp = 428 / hardSize;
      res = MediaQuery.of(Get.context!).size.width / temp;
    }
    return res;
  }
}