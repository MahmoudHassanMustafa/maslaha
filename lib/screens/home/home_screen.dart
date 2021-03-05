import 'package:maslaha/components/app_drawer/app_drawer.dart';
import 'package:maslaha/screens/home/components/category_cards.dart';
import 'package:maslaha/components/search_bar.dart';
import 'package:maslaha/screens/home/components/special_offer_cards.dart';
import 'package:maslaha/screens/home/components/top_worker_cards.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCards(),
                    TopWorkerCards(),
                    SpecialOfferCards(),
                  ],
                ),
              ),
            ),
            SearchBar(),
          ],
        ),
      ),
    );
  }
}
