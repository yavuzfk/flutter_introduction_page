import 'package:flutter/material.dart';
import 'package:introduction_page/introduction_screen/viewmodel/hive_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _appBarTitle = 'Home Page Screen';
  final String _buttonText = 'Delete Hive Data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: Center(
          child: ElevatedButton(
        child: Text(_buttonText),
        onPressed: () {
          hiveDelete(HiveGetText().hiveBoxKey);
        },
      )),
    );
  }
}
