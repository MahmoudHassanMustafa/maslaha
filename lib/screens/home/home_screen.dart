import 'package:flutter/material.dart';

import '../../components/app_drawer/app_drawer.dart';
import '../../components/search_bar.dart';
import '../home/components/category_cards.dart';
import '../home/components/special_offer_cards.dart';
import '../home/components/top_worker_cards.dart';

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
