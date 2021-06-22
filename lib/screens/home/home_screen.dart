import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../../widgets/search_bar.dart';
import '../drawer/app_drawer.dart';
import '../home/components/special_offer_cards.dart';
import '../home/components/top_worker_cards.dart';
import 'components/category_card.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  // TODO: get user-name here
  final username = 'Mahmoud';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return AppDrawer(
      home: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            SearchBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSectionTitle('How can we serve you, $username?'),
                    CategoryCard(),
                    buildSectionTitle('Top Workers'),
                    TopWorkerCards(),
                    buildSectionTitle('Special Offers'),
                    SpecialOfferCards(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String sectionTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Text(
        sectionTitle,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
