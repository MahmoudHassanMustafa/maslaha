import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryCards extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      "category": "House Cleaning",
      "icon": FontAwesomeIcons.sprayCan,
      "image":
          "https://greenbuildinginsider.com/wp-content/uploads/2018/11/shutterstock_395889778.jpg.webp"
    },
    {
      "category": "Hair Care",
      "icon": Icons.cut_outlined,
      "image":
          "https://www.thetrendspotter.net/wp-content/uploads/2020/03/Best-Barbershops-in-Perth.jpg"
    },
    {
      "category": "Babysetting",
      "icon": FontAwesomeIcons.babyCarriage,
      "image":
          "https://www.babybathmoments.com/wp-content/uploads/2020/01/featured-2-4.jpg"
    },
    {
      "category": "Carpentry",
      "icon": Icons.carpenter_rounded,
      "image": "https://sevenseasjob.com/img/job/carpentry.jpg"
    },
    {
      "category": "Plumbing",
      "icon": Icons.plumbing,
      "image":
          "https://images.squarespace-cdn.com/content/v1/5a4676a280bd5ea8bd703e57/1531727505841-L90K9MG3WVFTAKQ8RF0D/ke17ZwdGBToddI8pDm48kG87Sfbgg29A4BYEDq3OXvgUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcf4OxbJOyh_wHUnyc4kQLQ6SBshRGOku7c30Y_IRDNPta8R2IY5BHMaEj1zOWoDTZ/emergency+plumber+okc?format=1000w"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Text(
            'How can we serve you, Mahmoud?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          margin: EdgeInsets.only(bottom: 10.0),
          height: MediaQuery.of(context).size.height * 0.20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print('category card pressed!');
                  print(
                      'show list of service providers under ${categories[index]['category']} category');
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Icon(
                                    categories[index]['icon'],
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          categories[index]['image']),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0)),
                                  ),
                                ),
                              ),
                            ]),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                categories[index]['category'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
