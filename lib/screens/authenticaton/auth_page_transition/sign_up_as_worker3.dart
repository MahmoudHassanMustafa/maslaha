import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:maslaha/screens/authenticaton/auth_components/alertToast.dart';
import 'package:maslaha/screens/authenticaton/auth_components/arrow_back_button.dart';
import 'package:maslaha/screens/authenticaton/auth_components/auth_button.dart';
import 'package:maslaha/screens/authenticaton/auth_components/auth_title.dart';
import 'package:maslaha/screens/authenticaton/auth_page_transition/slid_right_transition.dart';
import 'package:maslaha/screens/authenticaton/verify_your_email_screen.dart';
import 'package:maslaha/screens/home/home_screen.dart';
import 'package:maslaha/shared/constants.dart';
import 'package:maslaha/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpAsWorker3 extends StatefulWidget {
  late String gender;
  late File? image;
  late String email;
  late String password;
  late String name;
  late String birthDate;
  late String phone;
  late String nationalID;
  late String address;
  SignUpAsWorker3({required this.address,required this.phone,required this.nationalID,required this.birthDate,required this.email,required this.name,required this.gender,required this.password,required this.image});
  @override
  _SignUpAsWorker3State createState() => _SignUpAsWorker3State();
}

class _SignUpAsWorker3State extends State<SignUpAsWorker3> {
  bool isLoading = false;
  var category;
  String serviceName='';
  String initialPrice='';
  String description='';
  List _testList = [{'no': 1, 'keyword': 'Car maintenance'},{'no': 2, 'keyword': 'House'},{'no': 3, 'keyword': 'other'}];
  late List<DropdownMenuItem> _dropdownTestItems;
//  var _selectedTest;

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(_testList);
    super.initState();
  }

  List<DropdownMenuItem> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem> items =[];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }
  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      category = selectedTest;
    });
  }
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
                    top: getProportionateScreenHeight(50),
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
                authTitle("Personal Info", 325, 135),
                //select category Field
                Positioned(
                  top: getProportionateScreenHeight(368),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                    width: getProportionateScreenWidth(302),
                    height: getProportionateScreenHeight(70),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownBelow(
                                itemWidth: getProportionateScreenWidth(302),
                                itemTextstyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                                boxTextstyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0XFFbbbbbb)),
                                boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
                                boxHeight: 45,
                                boxWidth: 200,
                                hint: Text('Category', style: TextStyle(
                                    color: Colors.grey
                                ),),
                                boxDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                style: TextStyle(
                                  color: Colors.blue
                                ),
                                value: category,
                                items: _dropdownTestItems,
                                onChanged: onChangeDropdownTests,
                              ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.arrow_downward,color: Colors.blue,),
                            )
                          ],
                        ),
//                    TextFormField(
//                      onChanged: (val){
//                        setState(() {
//                          category=val;
//                        });
//                      },
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(
//                            borderSide:BorderSide(color: Color(0xffE4DCDC)),borderRadius: BorderRadius.circular(15)),
//                        hintText: "Caegory",
////                        prefixIcon: Icon(
////                          Icons.account_box_outlined,
////                          color: Color(0xffA0BBF0),
////                        ),
//                      ),
//                    ),
                  ),
                ),
                //service name Field
                Positioned(
                  top: getProportionateScreenHeight(440),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                    width: getProportionateScreenWidth(302),
//                    height: getProportionateScreenHeight(36),
                    child: TextFormField(
                      onChanged: (val){
                        setState(() {
                          serviceName=val;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:BorderSide(color: Color(0xffE4DCDC)),borderRadius: BorderRadius.circular(15)),
                        hintText: "Service Name",
                        prefixIcon: Icon(
                          Icons.home_repair_service,
                          color: Color(0xffA0BBF0),
                        ),
                      ),
                    ),
                  ),
                ),
                //initial price Field
                Positioned(
                  top: getProportionateScreenHeight(520),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                    width: getProportionateScreenWidth(302),
//                    height: getProportionateScreenHeight(36),
                    child: TextFormField(
                      onChanged: (val){
                        setState(() {
                          initialPrice=val;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:BorderSide(color: Color(0xffE4DCDC)),borderRadius: BorderRadius.circular(15)),
                        hintText: "Initial Price",
                        prefixIcon: Icon(
                          Icons.attach_money_outlined,
                          color: Color(0xffA0BBF0),
                        ),
                      ),
                    ),
                  ),
                ),
                //Description cost
                //initial price Field
                Positioned(
                  top: getProportionateScreenHeight(610),
                  left: getProportionateScreenWidth(37),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: getProportionateScreenWidth(302),
                    height: getProportionateScreenHeight(140),
                    decoration: BoxDecoration(
//                        color: Color(0xffE4DCDC),
                        borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey,)
                    ),
                    child: TextFormField(
                      maxLines: null,
                      onChanged: (val){
                        setState(() {
                          description=val;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
//                        border: OutlineInputBorder(
//                            borderSide:BorderSide(color: Color(0xffE4DCDC)),borderRadius: BorderRadius.circular(15)),
                        hintText: "Description",
                      ),
                    ),
                  ),
                ),
                authButton(isLoading?"Loading":"Sign Up", ()async {
                  print("this is category ${category["keyword"]}");
                  if(category["keyword"] !="" && serviceName!="" && initialPrice!="" && description!=""){
//                    Navigator.of(context).push(SlidRight(page: VerifyYourEmailScreen(
//                      phone: widget.phone,
//                      nationalID: widget.nationalID,
//                      birthDate: widget.birthDate,
//                      address: widget.address,
//                      image: widget.image,
//                      password: widget.password,
//                      email: widget.email,
//                      name: widget.name,
//                      gender: widget.gender,
//                      description: description,
//                      category: category["keyword"],
//                      initialPrice: initialPrice,
//                      serviceName: serviceName,
//                    )));
                    try{
                      setState(() {
                        isLoading=true;
                      });
                      print("this is category ${category}");
                      var url = Uri.parse('https://masla7a.herokuapp.com/accounts/sign-up');
                      var request =http.MultipartRequest('POST',url);
                      final file=await http.MultipartFile.fromPath("profilePic", widget.image!.path);
                      request.files.add(file);
                      request.fields["name"]=widget.name;
                      request.fields["email"]=widget.email;
                      request.fields["password"]=widget.password;
//                    request.fields["confirm_password"]=widget.password;
                      request.fields["birthDate"]="12/09/19";
                      request.fields["nationalID"]=widget.nationalID;
                      request.fields["phone_number"]=widget.phone;
                      request.fields["gender"]=widget.gender;
                      request.fields["userName"]=widget.name;
                      request.fields["role"]="serviceProvider";
                      request.fields["category"]=category["keyword"];
                      request.fields["serviceName"]=serviceName;
                      //3 Shaaker El Gendi St.- El Sharabia - Cairo - Egypt
                      request.fields["address"]="3 Shaaker El Gendi St.- El Sharabia - Cairo - Egypt";
                      request.fields["description"]=description;
                      request.fields["servicePrice"]=initialPrice;
                      var response = await request.send();
                      final respStr = await response.stream.bytesToString();
                      var result =json.decode(respStr);
                      print(respStr);
                      print("this is the token ${result["token"]}");
                      setState(() {
                        isLoading=false;
                      });
                      if(response.statusCode == 200){
                        SharedPreferences pref=await SharedPreferences.getInstance();
                        pref.setString("token", result["token"]);
                        pref.setBool("isAuth", true);
                        pref.setString("id", result["_id"]);
                        Navigator.of(context)
                            .push(SlidRight(page: HomeScreen()));
                      }
                    }catch(ex){
                      setState(() {
                        isLoading=false;
                      });
                      alertToast("$ex", Colors.red, Colors.white);
                      print("error with sed signup client request $ex");
                    }
                  }else{
                    alertToast("Please Provide All Data",Colors.red, Colors.white);
                  }
                }, 755, 71),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
