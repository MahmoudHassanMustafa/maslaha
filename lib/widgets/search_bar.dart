import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 12, 16, 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(0.0, 2.0),
              blurRadius: 5,
            ),
          ]),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black87,
            ),
            hintText: 'Search services, service provider, etc..',
            hintStyle: TextStyle(fontSize: 10.0),
            suffixIcon: GestureDetector(
              onTap: () {
                print('filter');
              },
              child: Icon(
                Icons.filter_list,
                color: Colors.black87,
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
