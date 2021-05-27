import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import '../../../widgets/dialog_box.dart';

class SpecialOfferCards extends StatelessWidget {
  final List<Map<String, dynamic>> offers = [
    {
      "title": "50% off for 3 days.",
      "profile":
          "https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "offer_cover":
          "https://www.thetrendspotter.net/wp-content/uploads/2020/03/Best-Barbershops-in-Perth.jpg",
      "service": "Hair Care",
      "description":
          "A big discount for those looking for impressive hair cuts enjoy any hair cut with 50% off for the next 3 days, Greetings to you all."
    },
    {
      "title": "Free beautiful antique.",
      "profile":
          "https://images.unsplash.com/photo-1593104547489-5cfb3839a3b5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=736&q=80",
      "offer_cover":
          "https://top10cairo.com/wp-content/uploads/2020/10/Top-Interior-Design-Companies-Cairo-Egypt-696x392.jpg",
      "service": "Interior Design",
      "description":
          "get a simple yet beautiful piece of antique, for your home decoration as a gift upon your home interior design."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      height: getProportionateScreenHeight(165),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogBox(
                    tag: 'assets/icons/price-tag.svg',
                    title: offers[index]['title'],
                    description: offers[index]['description'],
                    actionButtonTitle: 'Vist profile',
                    // TODO: go to servicer provider profile
                    actionButtonFunction: () => print('Navigate to profile'),
                  );
                },
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Colors.white,
              child: Stack(children: [
                Container(
                  width: getProportionateScreenWidth(210),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(offers[index]['offer_cover']),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(210),
                  decoration: BoxDecoration(
                    color: Colors.black38.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // TODO: go to offer provider on click
                              print('navigate to profile');
                            },
                            child: CircleAvatar(
                              radius: 27.0,
                              backgroundColor: Colors.grey[200],
                              child: ClipOval(
                                child: Image.network(
                                  offers[index]['profile'],
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text(
                              offers[index]['service'],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12.0,
                              ),
                            ),
                            Container(
                              width: getProportionateScreenWidth(200),
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                offers[index]['title'],
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
