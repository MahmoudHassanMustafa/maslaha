import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_item_ratings_and_reviews.dart';
import '../../../utils/size_config.dart';
import 'star_rating_line.dart';

class RatingAndReviews extends StatefulWidget {
  List ratings;
  RatingAndReviews({required this.ratings});
  @override
  _RatingAndReviewsState createState() => _RatingAndReviewsState();
}

class _RatingAndReviewsState extends State<RatingAndReviews> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return widget.ratings.length != 0
        ? Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: getProportionateScreenWidth(350),
                    height: getProportionateScreenHeight(500),
                    child: Stack(children: [
                      Column(
                        children: [
                          //Rating And Reviews Title
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ratings And Reviews',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(14),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: .8),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "More Relevent >",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(12),
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5585E5),
                                      letterSpacing: .8),
                                ),
                              ),
                            ],
                          ),
                          //List view Tiles in List View(Comments)
                          Container(
                            height: getProportionateScreenHeight(300),
                            child: ListView(
                                scrollDirection: Axis.vertical,
                                children: widget.ratings.map((rating) {
                                  return ListItemRatingsAndReviews(
                                    image: rating["user"]["profilePic"],
                                    userName: rating["user"]["name"],
                                    rating: rating["rating"],
                                    description: rating["content"],
                                  );
                                }).toList()),
                          ),
                        ],
                      ),
                      //Send A request button
                      Positioned(
                        bottom: 20,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(10)),
                              width: getProportionateScreenWidth(343),
                              height: getProportionateScreenWidth(50),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Write a review ...",
                                    hintStyle: TextStyle(
                                        color: Color(0xffC4C5C9),
                                        fontSize:
                                            getProportionateScreenHeight(15)),
                                    suffixIcon: Container(
                                        width: getProportionateScreenWidth(130),
                                        height:
                                            getProportionateScreenHeight(12),
                                        child: StarRating(
                                          onRatingChanged: (rating) => setState(
                                              () => this.rating = rating),
                                          color: Colors.yellow,
                                          rating: rating,
                                        )),
                                    prefixIcon: Icon(
                                      Icons.emoji_emotions,
                                      size: getProportionateScreenHeight(30),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    fillColor: Color(0xffF1F2F6),
                                    filled: true),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                width: getProportionateScreenWidth(343),
                                height: getProportionateScreenHeight(45),
                                child: Center(
                                  child: Text(
                                    "Send A Request",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenWidth(16)),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xff4378E3),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff4378E3),
                                          spreadRadius: .2,
                                          blurRadius: 10,
                                          offset: Offset(0, 1))
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          )
        : Center(
            child: Text(
              "Ratings and Reviews",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          );
  }
}
