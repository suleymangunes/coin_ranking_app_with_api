import 'package:coin_siralama/controllers/controller_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerApi controller = Get.find();
    return Obx((() {
      return ListTile(
        title: Text('dark'.tr),
        trailing: Switch(
          value: controller.themDark.value, 
          onChanged: ((value) {
            controller.themDark.value = value;
            Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
          })
        ),
      );
    }));
  }
}