import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  static const routeName = '/orders';
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff4378E3),
              )),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Orders",
            style: TextStyle(
                color: Color(0xff4378E3), fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pending",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Complete",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cancelled",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //pending orders
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height / 3.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              //First row
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Car wash",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Pending",
                                      style: TextStyle(
                                        color: Color(0xffF2B900),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //second row
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, left: 8, top: 15, bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Assigned",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Roy Reynolds",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Schedule",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "12 sep | 12pm to 1 am",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //button
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red),
                                child: Center(
                                  child: Text(
                                    "Cancel Order",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ////////////////////////////////////////////////////////
            //complete orders
            Center(
              child: Text(
                "second",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ////////////////////////////////////////////////////////
            //cancelled orders
            Center(
              child: Text(
                "third",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
