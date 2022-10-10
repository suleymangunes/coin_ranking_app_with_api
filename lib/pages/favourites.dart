import 'package:coin_siralama/controllers/controller_api.dart';
import 'package:coin_siralama/pages/designs.dart/list_tile_for_favourite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    ControllerApi controller = Get.find();
    return Obx((() {
      return controller.favourited.isNotEmpty 
        ?
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return 
            ListTileFavDesign(index);
          }),
          itemCount: controller.favourited.length,
        )
        :
        Center(
          child: Card(
            
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "favinfo".tr,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
    }));
  }
}