import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../utils/user_status_parser.dart';
import '../../../models/top_worker_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/status_badge.dart';
import '../../../utils/size_config.dart';

class TopWorkerCards extends StatefulWidget {
  @override
  _TopWorkerCardsState createState() => _TopWorkerCardsState();
}

class _TopWorkerCardsState extends State<TopWorkerCards> {
  List<TopWorker> _topWorkers = [];

  _getTopWorkers() async {
    var userPrefs = await SharedPreferences.getInstance();
    var currentToken = userPrefs.getString('token');

    var url = Uri.https('masla7a.herokuapp.com', '/home/top-workers');
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'x-auth-token' '$currentToken',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    var resBody = await json.decode(response.body);

    List<TopWorker> topWorkers = [];
    if (response.statusCode == 200) {
      resBody['serviceProviders'].forEach((worker) {
        topWorkers.add(TopWorker(
          id: worker['serviceProvider'][0]['_id'],
          name: worker['serviceProvider'][0]['name'],
          status: worker['serviceProvider'][0]['availability'],
          gender: worker['serviceProvider'][0]['gender'],
          profilePic: worker['serviceProvider'][0]['profilePic'],
          serviceName: worker['serviceName'],
          rating: worker['averageRating'],
          isFav: worker['favourite'],
        ));
      });

      _topWorkers = topWorkers;
    }
  }

  @override
  void initState() {
    super.initState();
    _getTopWorkers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      constraints: BoxConstraints(
        maxHeight: getProportionateScreenHeight(270),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _topWorkers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // TODO: go to the worker profile on click
              print('top worker card pressed!');
              print('navigate to profile');
            },
            child: Container(
              constraints: BoxConstraints(
                maxWidth: getProportionateScreenWidth(210),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: getProportionateScreenHeight(200),
                          width: getProportionateScreenWidth(210),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  NetworkImage(_topWorkers[index].profilePic),
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 14,
                          child: Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.star_rate_rounded,
                                    color: Color(0xFFFFDF00)),
                                Text(
                                  _topWorkers[index].rating.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Wrap(
                                direction: Axis.vertical,
                                children: [
                                  Row(
                                    children: [
                                      StatusBadge(
                                          status: statusParser(
                                              _topWorkers[index].status)),
                                      const SizedBox(width: 4),
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              getProportionateScreenWidth(130),
                                        ),
                                        child: Text(
                                          _topWorkers[index].name,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          getProportionateScreenWidth(140),
                                    ),
                                    child: Text(
                                      _topWorkers[index].serviceName,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: IconButton(
                                // TODO: add to favs
                                onPressed: () {
                                  // setState(() {
                                  //   topWorkers[index]['isFav'] =
                                  //       !topWorkers[index]['isFav'];
                                  // });
                                },
                                icon: Icon(_topWorkers[index].isFav
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border),
                                color: _topWorkers[index].isFav
                                    ? Colors.red
                                    : Colors.black54,
                                iconSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
