import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../shared/constants.dart';
import '../../shared/size_config.dart';
import 'auth_components/arrow_back_button.dart';
import 'auth_components/auth_button.dart';
import 'auth_components/auth_title.dart';
import 'auth_page_transition/slid_right_transition.dart';
import 'create_new_password_screen.dart';

class VerifyYourEmailScreen extends StatelessWidget {
  static String routeName = "/VerifyYourEmailScreen";
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        border: Border.all(color: kAuthMainColor),
        borderRadius: BorderRadius.circular(15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAuthMainColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              arrowBackButton(context),
              Positioned(
                top: getProportionateScreenHeight(301),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: getProportionateScreenHeight(512),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.white,
                  ),
                ),
              ),
              //image
              Positioned(
                  top: getProportionateScreenHeight(110),
                  left: getProportionateScreenWidth(55),
                  child: Container(
                    width: getProportionateScreenWidth(284),
                    height: getProportionateScreenHeight(165),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/auth_images/Authentication-pana@1X.png"),
                          fit: BoxFit.contain),
                    ),
                  )),
              authTitle("Verify your e-mail", 368, 96),
              Positioned(
                top: getProportionateScreenHeight(417),
                left: getProportionateScreenWidth(52),
                child: Container(
                  width: getProportionateScreenWidth(269),
                  height: getProportionateScreenHeight(48),
                  child: Center(
                    child: Text(
                      "Please enter the 4 digit code sent to name@example.com",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(17),
                        color: kTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              //PIN code
              Positioned(
                top: getProportionateScreenHeight(484),
                left: getProportionateScreenWidth(40),
                right: getProportionateScreenWidth(40),
                child: PinPut(
                  fieldsCount: 4,
                  onSubmit: (_) {},
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color(0xFF979797),
                    ),
                  ),
                ),
              ),
              authButton("Verify", () {
                //Normal Navigate
                //Navigator.pushNamed(context, CreateNewPasswordScreen.routeName);
                //Slid Right Navigate
                Navigator.of(context)
                    .push(SlidRight(page: CreateNewPasswordScreen()));
              }, 650, 71),
              //Timer
              Positioned(
                top: getProportionateScreenHeight(570),
                left: getProportionateScreenWidth(140),
                child: Container(
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenHeight(35),
                  child: Center(
                    child: TweenAnimationBuilder<Duration>(
                        duration: Duration(minutes: 2),
                        tween: Tween(
                            begin: Duration(minutes: 2), end: Duration.zero),
                        onEnd: () {
                          print('Timer ended');
                        },
                        builder: (BuildContext context, Duration value,
                            Widget? child) {
                          final minutes = value.inMinutes;
                          final seconds = value.inSeconds % 60;
                          return Text('$minutes:$seconds',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff4C4C4C), fontSize: 31));
                        }),
                  ),
                ),
              ),
              //Resend Code Button
              Positioned(
                top: getProportionateScreenHeight(733),
                left: getProportionateScreenWidth(146),
                child: GestureDetector(
                  onTap: () {
                    //Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                  },
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      color: kAuthMainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
