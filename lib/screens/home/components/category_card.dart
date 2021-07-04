import 'dart:convert';
// import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:maslaha/models/category_model.dart' as cat;

import '../../../utils/size_config.dart';

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  List<cat.Category> _categories = [];
  final _catColors = const [
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.deepOrangeAccent,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.tealAccent,
    Colors.amberAccent,
  ];

  _getCategoriesInfo() async {
    var url = Uri.https('masla7a.herokuapp.com', '/categories');
    var response = await http.get(url);

    var resBody = await json.decode(response.body);

    List<cat.Category> categories = [];
    if (response.statusCode == 200) {
      resBody['categories'].forEach((category) {
        categories.add(cat.Category(
          id: category['_id'],
          name: category['name'],
          coverPicUrl: category['coverPhoto'],
          iconUrl: category['icon'],
        ));
      });
    }

    _categories = categories;
  }

  @override
  void initState() {
    super.initState();
    _getCategoriesInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      height: getProportionateScreenHeight(150),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('category card pressed!');
              // TODO: navigate to services under each category
              print(
                  'show list of services under ${_categories[index].name} category');
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              // Generating a random color for each card if desired.
              //  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              //     .withOpacity(1.0),
              color: _catColors[index],
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
                          child: SvgPicture.network(
                            _categories[index].iconUrl,
                            color: Colors.white,
                            fit: BoxFit.scaleDown,
                            width: getProportionateScreenWidth(25),
                            height: getProportionateScreenHeight(25),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: getProportionateScreenWidth(84),
                          height: getProportionateScreenHeight(100),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                _categories[index].coverPicUrl,
                              ),
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
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          _categories[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
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
