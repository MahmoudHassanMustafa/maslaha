import 'package:flutter/material.dart';

class TopWorkerCards extends StatelessWidget {
  final List<Map<String, dynamic>> workers = [
    {
      "name": "Sergio de Paula",
      "image":
          "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "rating": 3.0,
      "service": "Mechanic",
      "jobs_done": 144,
    },
    {
      "name": "Dan",
      "image":
          "https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      "rating": 4.5,
      "service": "Barber",
      "jobs_done": 124,
    },
    {
      "name": "Christina Campbell",
      "image":
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80",
      "rating": 5.0,
      "service": "Engineer",
      "jobs_done": 92,
    },
    {
      "name": "Abbe Nolan",
      "image":
          "https://images.unsplash.com/photo-1593104547489-5cfb3839a3b5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=736&q=80",
      "rating": 4.0,
      "service": "Interior designer",
      "jobs_done": 84,
    },
    {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Text(
            'Top workers',
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
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: workers.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print('top worker card pressed!');
                  print('navigate to profile');
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: MediaQuery.of(context).size.height * 0.21,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(workers[index]['image']),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.transparent,
                            ),
                          ),
                          Positioned(
                              left: 0,
                              top: 14,
                              child: Container(
                                padding: EdgeInsets.only(right: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.star_rate_rounded,
                                        color: Color(0xFFFFDF00)),
                                    Text(
                                      workers[index]['rating'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              )),
                        ]),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.55,
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 120.0,
                                      child: Text(
                                        workers[index]['name'],
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      workers[index]['service'],
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Jobs done',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    workers[index]['jobs_done'].toString(),
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
