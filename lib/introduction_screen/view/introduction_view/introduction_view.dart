import 'package:flutter/material.dart';
import 'package:introduction_page/introduction_screen/viewmodel/hive_functions.dart';
import 'package:introduction_page/introduction_screen/view/pages/home_page.dart';
import 'package:introduction_page/introduction_screen/view/pages/intro_page_1.dart';
import 'package:introduction_page/introduction_screen/view/pages/intro_page_2.dart';
import 'package:introduction_page/introduction_screen/view/pages/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool onLastPage = false;
  bool introShown = false;
  @override
  void initState() {
    super.initState();
  }

  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
              alignment: const Alignment(0.0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(
                            2); // 0 -> first page | 1 -> second page | 2 -> last page because there are 3
                      },
                      child: const Text('skip')),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            hiveWrite(HiveGetText().hiveBoxKey, true);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: const Text('done'))
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: const Text('next'))
                ],
              ))
        ],
      ),
    );
  }
}
