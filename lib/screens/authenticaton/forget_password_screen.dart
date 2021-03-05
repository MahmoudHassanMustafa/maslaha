import 'package:maslaha/screens/authenticaton/verify_your_email_screen.dart';
import 'package:maslaha/shared/constants.dart';
import 'package:maslaha/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'auth_components/arrow_back_button.dart';
import 'auth_components/auth_button.dart';
import 'auth_components/auth_title.dart';
import 'auth_page_transition/slid_right_transition.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = "/ForgetPasswordScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAuthMainColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
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
                    top: getProportionateScreenHeight(102),
                    left: getProportionateScreenWidth(80),
                    child: Container(
                      width: getProportionateScreenWidth(215),
                      height: getProportionateScreenHeight(217),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/auth_images/Forgot password-pana@1X.png"),
                            fit: BoxFit.contain),
                      ),
                    )),
                authTitle("Forget password", 368, 102),
                //Email Field
                Positioned(
                  top: getProportionateScreenHeight(497),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    width: getProportionateScreenWidth(302),
                    height: getProportionateScreenHeight(36),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your E-mail",
                        prefixIcon: Icon(Icons.email_outlined,
                            color: Color(0xffA0BBF0)),
                      ),
                    ),
                  ),
                ),
                authButton("Send", () {
                  //Normal Navigate
                  //Navigator.pushNamed(context, VerifyYourEmailScreen.routeName);
                  //Slid Right Navigate
                  Navigator.of(context)
                      .push(SlidRight(page: VerifyYourEmailScreen()));
                }, 650, 71),
                // try another way button
                Positioned(
                  top: getProportionateScreenHeight(733),
                  left: getProportionateScreenWidth(138),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ForgetPasswordScreen.routeName);
                    },
                    child: Text(
                      "Try another way",
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
      ),
    );
  }
}
