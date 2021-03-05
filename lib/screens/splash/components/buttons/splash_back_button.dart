import 'package:maslaha/shared/constants.dart';
import 'package:maslaha/shared/size_config.dart';
import 'package:flutter/material.dart';

class SplashBackButton extends StatefulWidget {
  const SplashBackButton({
    required this.pageController,
    this.animationController,
  });

  final PageController pageController;
  final AnimationController? animationController;

  @override
  _SplashBackButtonState createState() => _SplashBackButtonState();
}

class _SplashBackButtonState extends State<SplashBackButton> {
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _offset = Tween<Offset>(begin: Offset(-1.5, 0.0), end: Offset(0.0, 0.0))
        .animate(widget.animationController!);
  }

  void _perviousSlide(controller) {
    setState(() {
      controller.previousPage(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutSine,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: getProportionateScreenWidth(90),
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
              _perviousSlide(widget.pageController);
              print('Back');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(16),
                          letterSpacing: 0.75,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
