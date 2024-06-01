import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  // 866.2857142857143
  static double screenHeight = Get.context!.height;
  // 411.42857142857144
  static double screenWidth = Get.context!.width;

  // 866 / 320
  static double pageView = screenHeight / (866 / 320);

  // Get dividing factor using device_height / designed_height => (866 / 220)
  static double pageViewContainer = screenHeight / (866 / 220);

  // 866 / 120
  static double pageViewTextContainer = screenHeight / (866 / 120);

  static double height10 = screenHeight / (866 / 10);
  static double height15 = screenHeight / (866 / 15);
  static double height20 = screenHeight / (866 / 20);

  static double font20 = screenHeight / (866 / 20);

  // Instead of defining static variables again and again I am using a static function
  static double responsiveHeight(int value) {
    return screenHeight / (866 / value);
  }

  static double responsiveWidth(int value) {
    return screenHeight / (411 / value);
  }
}
