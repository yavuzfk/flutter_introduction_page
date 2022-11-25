import 'package:flutter/material.dart';
import 'package:introduction_page/introduction_screen/view/introduction_view/widget/intro_page_content.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    const String imagePath = 'assets/recipe_book.png';
    const String title = 'Flight Tracking App ile Yolculuğunuzu Taçlandırın';
    const String text =
        ' Yiyecek ve içecek siparişleriniz uçuş esnasında da kolayca alınır ve saniyeler içinde size ulaştırılır.';

    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntroPageContent(
          imagePath: imagePath,
          title: title,
          text: text,
        ),
      )),
    );
  }
}
