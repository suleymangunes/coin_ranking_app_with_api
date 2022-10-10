import 'package:coin_siralama/controllers/controller_api.dart';
import 'package:coin_siralama/extensions/context_extensions.dart';
import 'package:coin_siralama/pages/designs.dart/alert_dialog_info.dart';
import 'package:coin_siralama/pages/designs.dart/trailing_fav_fav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTileFavDesign extends StatelessWidget {
  final index;
  const ListTileFavDesign(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerApi controller = Get.find();
    return Padding(
      padding: EdgeInsets.all(context.dynamicHeight(0.01)),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(context.dynamicHeight(0.01)),
            child: ListTile(
              onTap: (() {
                DialogDesignInfo().showMyDialog(context, controller.favourited[index]);
              }),
              leading: leadingList(context),
              title: titleList(context),
              trailing: trailingList(context),
            ),
          )
        ),
    );
  }

  leadingList(BuildContext context) {
    ControllerApi controller = Get.find();
    return Container(  // resim container icerisinde box decorationda eklendi
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,  // resim uyarlandi
          image: NetworkImage("https://s2.coinmarketcap.com/static/img/coins/64x64/${controller.sonuclar[controller.favourited[index]][0]["id"]}.png"),
          )
      ),
      );
  }

  titleList(BuildContext context) {
    ControllerApi controller = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Text(
            controller.sonuclar[controller.favourited[index]][0]["name"],
            style: TextStyle(
              fontWeight: context.fontWeight,
              fontSize: 17
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        SizedBox(
          child: Text(
            controller.sonuclar[controller.favourited[index]][0]["symbol"],
            style: TextStyle(
              fontSize: context.symbolSize,
            ),
          ),
        )
      ],
    );
  }
  
  trailingList(BuildContext context) {
    ControllerApi controller = Get.find();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(
                "\$${controller.sonuclar[controller.favourited[index]][0]["price"].toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: context.fontWeight,
                  fontSize: 15
                ),
              ),
            ),
            controller.sonuclar[controller.favourited[index]][0]["percent_change_24h"].toString()[0] == "-" ?
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,
                  size: context.symbolSize,
                ),
                Text(
                  controller.sonuclar[controller.favourited[index]][0]["percent_change_24h"].toString().substring(1),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.red
                  ),
                ),
              ],
            ):
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,
                  size: context.symbolSize,
                ),
                Text(
                  controller.sonuclar[controller.favourited[index]][0]["percent_change_24h"].toString(), 
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.green
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(right: context.dynamicWidth(0.01))),
        TrailingFavouriteFav(controller.favourited[index]),
      ],
    );
  }
}

