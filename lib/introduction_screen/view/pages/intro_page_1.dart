import 'package:flutter/material.dart';
import 'package:introduction_page/introduction_screen/view/introduction_view/widget/intro_page_content.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    const String imagePath = 'assets/flying_around.png';
    const String title = 'Lorem Ipsum is simply \ndummy text of the';
    const String text =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys ';

    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: IntroPageContent(
          imagePath: imagePath,
          title: title,
          text: text,
        ),
      )),
    );
  }
}
