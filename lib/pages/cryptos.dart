import 'package:coin_siralama/controllers/controller_api.dart';
import 'package:coin_siralama/pages/designs.dart/list_tile_for_cryptos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  @override
  Widget build(BuildContext context) {
    ControllerApi controller = Get.put(ControllerApi());
    return Obx((() {
      return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return ListTileDesign(index);
      }), 
      itemCount: controller.sonuclar.length
    );
    }));
  }
}

