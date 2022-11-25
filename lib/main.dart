import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:introduction_page/introduction_screen/viewmodel/hive_functions.dart';
import 'package:introduction_page/introduction_screen/view/introduction_view/introduction_view.dart';
import 'package:introduction_page/introduction_screen/view/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveGetText().hiveDatabaseName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: hiveRead(HiveGetText().hiveBoxKey)
          ? const HomePage()
          : const OnBoardingScreen(),
    );
  }
}
