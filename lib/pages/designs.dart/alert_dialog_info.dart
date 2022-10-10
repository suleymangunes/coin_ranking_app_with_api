import 'package:coin_siralama/controllers/controller_api.dart';
import 'package:coin_siralama/extensions/context_extensions.dart';
import 'package:coin_siralama/pages/designs.dart/trailing_favourite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogDesignInfo{
  Future<void> showMyDialog(BuildContext context, index) async {
    ControllerApi controller = Get.find();
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Obx((() {
          return AlertDialog(
          title: alertTitle(context, controller, index),
          content: alertContent(context, index),
          actions: <Widget>[alertAction(index)],
        );
        }));
      },
    );
  }

  alertTitle(BuildContext context, ControllerApi controller, index) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            alignment: Alignment.topRight,
            onPressed: (() {
              Navigator.pop(context);
            }), 
            icon: const Icon(Icons.close_rounded)
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(0.08),
          width: context.dynamicHeight(0.08),
          child: Image.network(
            "https://s2.coinmarketcap.com/static/img/coins/64x64/${controller.sonuclar[index][0]["id"]}.png",
          ),
        ),
      ],
    );
  }

  alertContent(BuildContext context, index) {
    ControllerApi controller = Get.find();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListBody(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                controller.sonuclar[index][0]["name"],
                style: TextStyle(
                  fontWeight: context.fontWeight,
                  fontSize: 20
                ),
              ),
              Text(
                controller.sonuclar[index][0]["symbol"],
                style: const TextStyle(
                  fontSize: 20
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(0.01))),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "pri".tr,
                  style: TextStyle(
                    fontWeight: context.fontWeight
                  ),
                ),
                Text(
                  "\$${controller.sonuclar[index][0]["price"].toString()}",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontWeight: context.fontWeight
                  ),
                )
              ],
            ),
          ),
          controller.sonuclar[index][0]["percent_change_1h"].toString()[0] == "-" 
          ?
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "change1".tr,
                  style: TextStyle(
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,  
                ),
                Text(
                  "\$${controller.sonuclar[index][0]["percent_change_1h"].toString().substring(1)}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                )
              ],
            ),
          )
          :
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "change1".tr,
                  style: TextStyle(
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,  
                ),
                Text(
                  "\$${controller.sonuclar[index][0]["percent_change_1h"].toString()}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                )
              ],
            ),
          ),
          controller.sonuclar[index][0]["percent_change_24h"].toString()[0] == "-" 
          ?
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "change24".tr,
                  style: TextStyle(
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,  
                ),
                Text(
                  "\$${controller.sonuclar[index][0]["percent_change_24h"].toString().substring(1)}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                )
              ],
            ),
          )
          :
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "change24".tr,
                  style: TextStyle(
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,  
                ),
                Text(
                  "\$${controller.sonuclar[index][0]["percent_change_24h"].toString()}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                )
              ],
            ),
          ),
          controller.sonuclar[index][0]["volume_24"].toString()[0] == "-" 
          ?
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "volume".tr,
                  style: TextStyle(
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,  
                ),
                Text(
                  "\$${controller.sonuclar[index][0]["volume_24"].toString().substring(1)}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                )
              ],
            ),
          )
          :
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "volume".tr,
                  style: TextStyle(
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,  
                ),
                Text(
                  "\$${controller.sonuclar[index][0]["volume_24"].toString()}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                )
              ],
            ),
          ),
          controller.sonuclar[index][0]["market_cap"].toString()[0] == "-" 
          ?
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "mcap".tr,
                  style: TextStyle(
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,  
                ),
                Text(
                  "\$${controller.sonuclar[index][0]["market_cap"].toString().substring(1)}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                )
              ],
            ),
          )
          :
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "mcap".tr,
                  style: TextStyle(
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,  
                ),
                Text(
                  "\$${controller.sonuclar[index][0]["market_cap"].toString()}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: context.fontWeight,
                    fontSize: 15
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  alertAction(index) => Center(child: TrailinFavourite(index));

}