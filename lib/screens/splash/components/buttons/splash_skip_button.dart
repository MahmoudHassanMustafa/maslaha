import 'package:flutter/material.dart';
import '../../../../shared/size_config.dart';

class SplashSkipButton extends StatefulWidget {
  const SplashSkipButton({
    required this.animationController,
    required this.pageController,
    required this.index,
  });

  final AnimationController animationController;
  final PageController pageController;
  final int index;

  @override
  _SplashSkipButtonState createState() => _SplashSkipButtonState();
}

class _SplashSkipButtonState extends State<SplashSkipButton> {
  late final Animation<Offset> _offset =
      Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(1.5, 0.0))
          .animate(widget.animationController);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            setState(() {
              widget.pageController.animateToPage(
                3,
                duration: Duration(seconds: 1),
                curve: Curves.easeIn,
              );
              print(widget.index);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: getProportionateScreenWidth(16),
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                  size: 18.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
