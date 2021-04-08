import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';
import '../components/buttons/splash_back_button.dart';
import '../components/buttons/splash_next_button.dart';
import '../components/buttons/splash_skip_button.dart';
import '../components/splash_content.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  late final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  late final AnimationController _skipButtonAnimationController =
      AnimationController(vsync: this, duration: kAnimationDuration);
  late final AnimationController _backButtonAnimationController =
      AnimationController(vsync: this, duration: kAnimationDuration);

  List<Map<String, String>> _splashData = [
    {
      "image": "assets/images/splash_images/find_your_service.svg",
      "title": "Find Your Desired Service",
      "description":
          "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor et."
    },
    {
      "image": "assets/images/splash_images/full_time_support.svg",
      "title": "Full-Time Support",
      "description":
          "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor et."
    },
    {
      "image": "assets/images/splash_images/virtual_workshops.svg",
      "title": "Virtual Workshops",
      "description":
          "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor et."
    },
    {
      "image": "assets/images/splash_images/online_payment.svg",
      "title": "Online Payment",
      "description":
          "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor et."
    },
  ];

  @override
  void dispose() {
    _skipButtonAnimationController.dispose();
    _backButtonAnimationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SplashSkipButton(
              pageController: _pageController,
              animationController: _skipButtonAnimationController,
              index: _currentPage,
            ),
            //  PageView slides.
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    //  Background circle
                    Center(
                      child: AspectRatio(
                        aspectRatio: 1.02,
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(100)),
                          decoration: BoxDecoration(
                            gradient: kPrimaryGradientColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: PageView.builder(
                        physics: _currentPage == 3
                            ? const NeverScrollableScrollPhysics()
                            : const AlwaysScrollableScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (value) {
                          setState(() {
                            _currentPage = value;
                          });

                          print('current page index: $_currentPage');

                          //  Start buttons animation according to slide change
                          switch (_currentPage) {
                            case 0:
                              _backButtonAnimationController.reverse();
                              break;
                            case 1:
                              _backButtonAnimationController.forward();
                              break;
                            case 2:
                              _backButtonAnimationController.forward();
                              _skipButtonAnimationController.reverse();
                              break;
                            case 3:
                              _backButtonAnimationController.reverse();
                              _skipButtonAnimationController.forward();
                              break;
                            default:
                              break;
                          }
                        },
                        itemCount: _splashData.length,
                        itemBuilder: (context, index) => SplashContent(
                          image: _splashData[index]["image"],
                          title: _splashData[index]["title"],
                          description: _splashData[index]["description"],
                        ),
                      ),
                    ),
                  ],
                )),
            //  Dots.
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(),
                    //  Navigation buttons
                    Stack(
                      children: [
                        SplashBackButton(
                          pageController: _pageController,
                          animationController: _backButtonAnimationController,
                        ),
                        SplashNextButton(
                          index: _currentPage,
                          pageController: _pageController,
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  Animate the dots.
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5.0),
      height: getProportionateScreenHeight(7.5),
      width: _currentPage == index ? 20.0 : 6.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
