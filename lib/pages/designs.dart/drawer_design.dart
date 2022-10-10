import 'package:coin_siralama/extensions/context_extensions.dart';
import 'package:coin_siralama/pages/designs.dart/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'change_language.dart';


class DrawerDesign extends StatelessWidget {
  const DrawerDesign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          drawerHeader(context),
          const ChangeTheme(),
          const ChangeLanguage()
        ],
      ),
    );
  }

  DrawerHeader drawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 87, 103, 1),
      ),
      child: Column(
        children: [
          Text('bsprod'.tr ,style: const TextStyle(color: Colors.white),),
          SizedBox(
            height: context.dynamicHeight(0.15),
            child: Image.asset(
              "images/bs_png.png"
            ),
          )
        ],
      ),
    );
  }
}





