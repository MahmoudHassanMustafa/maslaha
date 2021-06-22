import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/constants.dart';
import '../../utils/size_config.dart';
import 'auth_components/arrow_back_button.dart';
import 'auth_components/auth_button.dart';
import 'auth_components/auth_title.dart';
import 'auth_components/social_Button.dart';
import 'auth_page_transition/slid_right_transition.dart';
import 'login_screen.dart';
import 'register_screen_2.dart';

class RegisterScreen1 extends StatelessWidget {
  static String routeName = "/RegisterScreen1";
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
                    top: getProportionateScreenHeight(58),
                    left: getProportionateScreenWidth(71),
                    child: Container(
                      width: getProportionateScreenWidth(204),
                      height: getProportionateScreenHeight(269),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/auth_images/Mobile login-pana@1X.png"),
                            fit: BoxFit.contain),
                      ),
                    )),
                authTitle("Create Account", 369, 109),
                //Name Field
                Positioned(
                  top: getProportionateScreenHeight(423),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    width: getProportionateScreenWidth(302),
                    height: getProportionateScreenHeight(36),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: "Enter your Name",
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Color(0xffA0BBF0),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                //Email Field
                Positioned(
                  top: getProportionateScreenHeight(490),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    width: getProportionateScreenWidth(302),
                    height: getProportionateScreenHeight(36),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your Email",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xffA0BBF0),
                        ),
                      ),
                    ),
                  ),
                ),
                authButton("Next", () {
                  //normal navigate
                  // Navigator.pushNamed(context, RegisterScreen2.routeName);
                  //Slid right navigate
                  Navigator.of(context)
                      .push(SlidRight(page: RegisterScreen2()));
                }, 577, 71),
                Positioned(
                  top: getProportionateScreenHeight(660),
                  left: getProportionateScreenWidth(89),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(13.5)),
                        ),
                        GestureDetector(
                          onTap: () {
                            //normal navigate
                            //Navigator.pushNamed(context,LoginScreen.routeName);
                            //Slid right Navigate
                            Navigator.of(context)
                                .push(SlidRight(page: LoginScreen()));
                          },
                          child: Text('Login',
                              style: TextStyle(
                                  color: kAuthMainColor,
                                  fontSize: getProportionateScreenWidth(13.5))),
                        ),
                      ],
                    ),
                  ),
                ),
                //OR row
                Positioned(
                  top: getProportionateScreenHeight(698),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(39),
                      right: getProportionateScreenWidth(39),
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  top: getProportionateScreenHeight(720),
                  left: getProportionateScreenWidth(213),
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
