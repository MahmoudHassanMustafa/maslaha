// import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/size_config.dart';

class CategoryCard extends StatelessWidget {
  List<Map<String, dynamic>> categories = [
    {
      'id': 'g0',
      'name': 'House Cleaning',
      'icon': FontAwesomeIcons.bacteria,
      'imageUrl':
          'https://greenbuildinginsider.com/wp-content/uploads/2018/11/shutterstock_395889778.jpg.webp',
      'color': Colors.blue,
    },
    {
      'id': 'g1',
      'name': 'Carpentry',
      'icon': Icons.carpenter_rounded,
      'imageUrl': 'https://sevenseasjob.com/img/job/carpentry.jpg',
      'color': Colors.brown,
    },
    {
      'id': 'g2',
      'name': 'Hair Care',
      'icon': Icons.cut_outlined,
      'imageUrl':
          'https://www.thetrendspotter.net/wp-content/uploads/2020/03/Best-Barbershops-in-Perth.jpg',
      'color': Colors.black54,
    },
    {
      'id': 'g3',
      'name': 'Babysetting',
      'icon': FontAwesomeIcons.babyCarriage,
      'imageUrl':
          'https://www.babybathmoments.com/wp-content/uploads/2020/01/featured-2-4.jpg',
      'color': Colors.deepPurple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      height: getProportionateScreenHeight(150),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('category card pressed!');
              // TODO: navigate to services under each category
              print(
                  'show list of services under ${categories[index]['name']} category');
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: categories[index]['color'],
              // Generating a random color for each card if desired.
              // Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
              child: Container(
                width: getProportionateScreenWidth(125),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 15.0),
                          child: Icon(
                            categories[index]['icon'],
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: getProportionateScreenWidth(80),
                          height: getProportionateScreenHeight(96),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  NetworkImage(categories[index]['imageUrl']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0)),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      categories[index]['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
