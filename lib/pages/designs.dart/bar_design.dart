import 'package:coin_siralama/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BarDesign extends StatefulWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(60);
  const BarDesign({Key? key}) : super(key: key);

  @override
  State<BarDesign> createState() => _BarDesignState();
}

class _BarDesignState extends State<BarDesign> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(0, 87, 103, 1),
      elevation: 7,
      title: FittedBox(
        fit: BoxFit.cover,
        child: Text("apptitle".tr,),
      ),
      actions: [
        SizedBox(
          width: context.dynamicWidth(0.13),
          child: Image.asset(
            "images/bs_png.png"
          ),
        ),
      ],
    );
  }
}