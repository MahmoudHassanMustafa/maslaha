import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../utils/size_config.dart';
import './auth_components/arrow_back_button.dart';
import './auth_components/auth_button.dart';
import './auth_components/auth_title.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  static String routeName = "/CreateNewPasswordScreen";
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
                  top: getProportionateScreenHeight(241),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: getProportionateScreenHeight(572),
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
                    top: getProportionateScreenHeight(113),
                    left: getProportionateScreenWidth(85),
                    child: Container(
                      width: getProportionateScreenWidth(205),
                      height: getProportionateScreenHeight(158),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/auth_images/Secure data-pana@1X.png"),
                            fit: BoxFit.contain),
                      ),
                    )),
                authTitle("Create new password", 344, 78),
                Positioned(
                  top: getProportionateScreenHeight(393),
                  left: getProportionateScreenWidth(27),
                  child: Container(
                    width: getProportionateScreenWidth(321),
                    height: getProportionateScreenHeight(50),
                    child: Center(
                      child: Text(
                        "Your new password must be different from previously used password.",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: kTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                //enter password Text Form Field
                Positioned(
                  top: getProportionateScreenHeight(500),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    width: getProportionateScreenWidth(302),
                    height: getProportionateScreenHeight(36),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your new Password",
                        prefixIcon:
                            Icon(Icons.lock_open, color: Color(0xffA0BBF0)),
                      ),
                    ),
                  ),
                ),
                //confirm password field
                Positioned(
                  top: getProportionateScreenHeight(570),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    width: getProportionateScreenWidth(302),
                    height: getProportionateScreenHeight(36),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Confirm your Password",
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Color(0xffA0BBF0),
                        ),
                      ),
                    ),
                  ),
                ),
                authButton("Save", () {}, 650, 71),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
