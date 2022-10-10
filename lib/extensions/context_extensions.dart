import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double val) => Get.height * val;
  double dynamicWidth(double val) => Get.width * val;
}

extension StyleExtension on BuildContext {
  double get symbolSize => 13;
  FontWeight get fontWeight => FontWeight.w500;
}


