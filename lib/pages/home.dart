import 'package:coin_siralama/controllers/controller_api.dart';
import 'package:coin_siralama/pages/cryptos.dart';
import 'package:coin_siralama/pages/designs.dart/navigation_bar.dart';
import 'package:coin_siralama/pages/favourites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'designs.dart/bar_design.dart';
import 'designs.dart/drawer_design.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  void initState() {
    super.initState();
    baslat();
  }
  
  Future<void> baslat() async {
    try{
        ControllerApi controller = Get.put(ControllerApi());
        await controller.getListingLatest(20);

      while (true) {
        await Future.delayed(const Duration(seconds: 60));
        ControllerApi controller = Get.put(ControllerApi());
        await controller.getListingLatest(20);
      }
    }
    catch (e) {
      ControllerApi controller = Get.find();
      controller.hataOldu();
    }
  }

  @override
  Widget build(BuildContext context) {
    ControllerApi controller = Get.put(ControllerApi());
    return Obx((() {
      return
        Scaffold(
          drawer: const DrawerDesign(),
          appBar: const BarDesign(),
          body: controller.seciliNavigation.value == 0 
            ?
            controller.sonuclar.isNotEmpty ?
            const CryptoScreen():
            controller.hata == 1 ?
            const Center(child: Text("Hata Oluştu Lütfen Uygulamayı tekar başlatın")):
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  "animations/8707-loading.zip",
                  width: 500
                )
              ],
            )
            :
            const FavouritesScreen(),
          bottomNavigationBar: const NavigationBarDesign(),
        );
    }));
  }
}

