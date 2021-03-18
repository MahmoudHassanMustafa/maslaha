import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/size_config.dart';
import '../../../../shared/constants.dart';
import '../../../welcome_screen.dart';

class SplashNextButton extends StatefulWidget {
  const SplashNextButton({
    required this.index,
    required this.pageController,
    this.animationController,
  });

  final int index;
  final PageController pageController;
  final AnimationController? animationController;

  @override
  _SplashNextButtonState createState() => _SplashNextButtonState();
}

class _SplashNextButtonState extends State<SplashNextButton> {
  void _nextSlide(PageController controller) {
    setState(() {
      controller.nextPage(
        duration: kAnimationDuration,
        curve: Curves.easeInOutSine,
      );
    });
  }

  void _moveToWelcomeScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSplashSeen', true);
    Navigator.pushNamed(context, WelcomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: widget.index < 3
            ? getProportionateScreenWidth(90)
            : MediaQuery.of(context).size.width,
        height: getProportionateScreenHeight(43),
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.zero,
            backgroundColor: kPrimaryColor,
          ),
          onPressed: () {
            widget.index == 3
                ? _moveToWelcomeScreen()
                : _nextSlide(widget.pageController);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Center(
                    //  Switch button label at splash end
                    child: widget.index < 3
                        ? buildButtonLabel(label: 'Next')
                        : buildButtonLabel(label: 'Get started'),
                  ),
                ),
                widget.index < 3
                    ? Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20.0,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildButtonLabel({required String label}) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: getProportionateScreenWidth(16),
        letterSpacing: 0.75,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
