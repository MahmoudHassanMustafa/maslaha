import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class FavouritesScreen extends StatelessWidget {
  static const routeName = '/favourites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Favourites',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container();
          },
        ),
      ),
    );
  }
}
