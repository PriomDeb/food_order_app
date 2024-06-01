import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // Get dividing factor using device_height / designed_height => (844 / 220 = 3.84)
  static double pageViewContainer = screenHeight / 3.84;

  // 844 / 120 = 7.03
  static double pageViewTextContainer = screenHeight / 7.03;
}
