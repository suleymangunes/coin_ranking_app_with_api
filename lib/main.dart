import 'package:coin_siralama/pages/home.dart';
import 'package:coin_siralama/translations/trans_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MessagesTrans(),
      locale: const Locale("en", "US"),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}
