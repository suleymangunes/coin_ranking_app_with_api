import 'package:coin_siralama/controllers/controller_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrailingFavouriteFav extends StatefulWidget {
  final index;
  const TrailingFavouriteFav(this.index, {Key? key}) : super(key: key);

  @override
  State<TrailingFavouriteFav> createState() => _TrailingFavouriteFavState();
}

class _TrailingFavouriteFavState extends State<TrailingFavouriteFav> {
  ControllerApi controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return controller.favourited.contains(widget.index) ?
    
    IconButton(
      onPressed: (() {
        setState(() {
          controller.favourited.remove(widget.index);
        });
      }),
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.favorite_outline_rounded, color: Colors.red,),
        secondChild: const Icon(Icons.favorite_rounded, color: Colors.red,),
        crossFadeState: controller.favourited.contains(widget.index) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(seconds: 1),
        firstCurve: Curves.bounceOut,
        secondCurve: Curves.bounceOut,
      ),
    )
    :
    IconButton(
      onPressed: (() {
        setState(() {
          controller.favourited.add(widget.index);
        });
      }) ,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.favorite_outline_rounded, color: Colors.red,),
        secondChild: const Icon(Icons.favorite_rounded, color: Colors.red,),
        crossFadeState: controller.favourited.contains(widget.index) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(seconds: 1),
        firstCurve: Curves.bounceOut,
        secondCurve: Curves.bounceOut,
      ),
    )
    ;
  }
}
