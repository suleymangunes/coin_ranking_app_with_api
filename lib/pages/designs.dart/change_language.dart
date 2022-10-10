import 'package:coin_siralama/controllers/controller_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    ControllerApi controller = Get.find();
    return Obx((() {
      return ListTile(
        title: Text('lang'.tr),
        trailing: DropdownButton<String>(
          focusColor: Colors.transparent,
          value: controller.dropdownValue.value,
          items: <String>['Turkish', 'English', 'German', 'Spanish']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            controller.dropdownValue.value = newValue!;
            if (controller.dropdownValue.value == "English") {
              Get.updateLocale(const Locale("en", "US"));
            } else if (controller.dropdownValue.value == "German") {
              Get.updateLocale(const Locale("de", "DE"));
            } else if (controller.dropdownValue.value == "Spanish") {
              Get.updateLocale(const Locale("es", "ES"));
            } else if (controller.dropdownValue.value == "Turkish") {
              Get.updateLocale(const Locale("tr", "TR"));
            }
          },
        ),
      );
    }));
  }
}