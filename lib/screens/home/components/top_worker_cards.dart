import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class TopWorkerCards extends StatelessWidget {
  final List<Map<String, dynamic>> workers = const [
    {
      "status": Colors.green,
      "name": "Sergio de Paula",
      "image":
          "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "rating": 3.0,
      "service": "Mechanic",
      "jobs_done": 144,
    },
    {
      "status": Colors.amber,
      "name": "Dan",
      "image":
          "https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "rating": 4.5,
      "service": "Barber",
      "jobs_done": 124,
    },
    {
      "status": Colors.amber,
      "name": "Christina Campbell",
      "image":
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80",
      "rating": 5.0,
      "service": "Engineer",
      "jobs_done": 92,
    },
    {
      "status": Colors.red,
      "name": "Abbe Nolan",
      "image":
          "https://images.unsplash.com/photo-1593104547489-5cfb3839a3b5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=736&q=80",
      "rating": 4.0,
      "service": "Interior designer",
      "jobs_done": 84,
    },
    {
      "status": Colors.green,
      "name": "Nicolas Green",
      "image":
          "https://images.unsplash.com/photo-1494708001911-679f5d15a946?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "rating": 3.0,
      "service": "Mechanic",
      "jobs_done": 78,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      height: getProportionateScreenHeight(240),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: workers.length,
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
                          height: getProportionateScreenHeight(170),
                          width: getProportionateScreenWidth(210),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(workers[index]['image']),
                              fit: BoxFit.fill,
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
                              color: Colors.white60,
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
                                  workers[index]['rating'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
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
                            Wrap(
                              direction: Axis.vertical,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: workers[index]['status'],
                                    ),
                                    const SizedBox(width: 4),
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            getProportionateScreenWidth(115),
                                      ),
                                      child: Text(
                                        workers[index]['name'],
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
                                Text(
                                  workers[index]['service'],
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                const Text(
                                  'Jobs done',
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  workers[index]['jobs_done'].toString(),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
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
