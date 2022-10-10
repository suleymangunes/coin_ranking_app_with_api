import 'package:coin_siralama/controllers/controller_api.dart';
import 'package:coin_siralama/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarDesign extends StatefulWidget {
  const NavigationBarDesign( {Key? key}) : super(key: key);

  @override
  State<NavigationBarDesign> createState() => _NavigationBarDesignState();
}

class _NavigationBarDesignState extends State<NavigationBarDesign> {

  
  @override
  Widget build(BuildContext context) {
    ControllerApi controller = Get.find();
    return Obx((() {
      return 
      controller.themDark.value ? 

      BottomNavigationBar(
      backgroundColor: const Color.fromRGBO(0, 87, 103, 1),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.monetization_on_outlined, color: Colors.yellow,),
          label: 'cryptos'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_rounded, color: Colors.red,),
          label: 'fav'.tr,
        ),
      ],
      currentIndex: controller.seciliNavigation.value,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black87,
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 15,
      ),
      selectedFontSize: 15,
      unselectedFontSize: 10,
      selectedLabelStyle: TextStyle(
        fontWeight: context.fontWeight
      ),
      onTap: ((value) {
          controller.seciliNavigation.value = value;
      }),
    )
    :
    BottomNavigationBar(
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.monetization_on_outlined, color: Colors.yellow,),
          label: 'cryptos'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_rounded, color: Colors.red,),
          label: 'fav'.tr,
        ),
      ],
      currentIndex: controller.seciliNavigation.value,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black87,
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 15,
      ),
      selectedFontSize: 15,
      unselectedFontSize: 10,
      selectedLabelStyle: TextStyle(
        fontWeight: context.fontWeight
      ),
      onTap: ((value) {
          controller.seciliNavigation.value = value;
      }),
    );
    }));
  }
}
