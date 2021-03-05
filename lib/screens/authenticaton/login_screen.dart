import 'package:maslaha/screens/authenticaton/auth_components/arrow_back_button.dart';
import 'package:maslaha/screens/authenticaton/auth_components/auth_button.dart';
import 'package:maslaha/screens/authenticaton/auth_components/social_Button.dart';
import 'package:maslaha/screens/authenticaton/auth_page_transition/slid_right_transition.dart';
import 'package:maslaha/screens/authenticaton/forget_password_screen.dart';
import 'package:maslaha/screens/authenticaton/register_screen_1.dart';
import 'package:maslaha/shared/constants.dart';
import 'package:maslaha/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth_components/auth_title.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
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
                  top: getProportionateScreenHeight(283),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: getProportionateScreenHeight(529),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: Colors.white,
                    ),
                  ),
                ),
                // login Image
                Positioned(
                    top: getProportionateScreenHeight(69),
                    left: getProportionateScreenWidth(63),
                    child: Container(
                      width: getProportionateScreenWidth(261),
                      height: getProportionateScreenHeight(246),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/auth_images/Login-pana@1X.png"),
                            fit: BoxFit.contain),
                      ),
                    )),
                authTitle("Welcome", 368, 140),
                //Email text form field
                Positioned(
                  top: getProportionateScreenHeight(423),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    width: getProportionateScreenWidth(302),
                    height: getProportionateScreenHeight(36),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your Email",
                        prefixIcon: Icon(Icons.email_outlined,
                            color: Color(0xffA0BBF0)),
                      ),
                    ),
                  ),
                ),
                //password text form field
                Positioned(
                  top: getProportionateScreenHeight(490),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    width: getProportionateScreenWidth(302),
                    height: getProportionateScreenHeight(37),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your Password",
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Color(0xffA0BBF0),
                        ),
                      ),
                    ),
                  ),
                ),
                authButton("Log in", () {}, 567, 71),
                Positioned(
                  top: getProportionateScreenHeight(637),
                  left: getProportionateScreenWidth(82),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account yet? ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(13.5)),
                        ),
                        GestureDetector(
                          onTap: () {
                            //Normal Navigate
                            //Navigator.pushNamed(context,RegisterScreen1.routeName);
                            //Slid right Navigate
                            Navigator.of(context)
                                .push(SlidRight(page: RegisterScreen1()));
                          },
                          child: Text('Sign up',
                              style: TextStyle(
                                  color: kAuthMainColor,
                                  fontSize: getProportionateScreenWidth(13.5))),
                        ),
                      ],
                    ),
                  ),
                ),
                //Forget password Screen
                Positioned(
                  top: getProportionateScreenHeight(664),
                  left: getProportionateScreenWidth(133),
                  child: GestureDetector(
                    onTap: () {
                      //Normal Navigate
                      //Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                      //Slid right Navigate
                      Navigator.of(context)
                          .push(SlidRight(page: ForgetPasswordScreen()));
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: kAuthMainColor,
                      ),
                    ),
                  ),
                ),
                //OR Row
                Positioned(
                  top: getProportionateScreenHeight(698),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(37),
                      right: getProportionateScreenWidth(37),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: getProportionateScreenWidth(140),
                          child: Divider(
                            //color:kFieldBorder,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            "Or",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          width: getProportionateScreenWidth(140),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //social buttons
                Positioned(
                  top: getProportionateScreenHeight(720),
                  left: getProportionateScreenWidth(116),
                  child: socialButton(
                      FontAwesomeIcons.google, () {}, Color(0xffB90B0B)),
                ),
                Positioned(
                  top: getProportionateScreenHeight(720.0),
                  left: getProportionateScreenWidth(213.0),
                  child: socialButton(
                      FontAwesomeIcons.facebookF, () {}, Color(0xff064FAE)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
