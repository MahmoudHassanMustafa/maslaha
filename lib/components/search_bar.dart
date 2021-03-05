import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: Colors.black54,
            style: BorderStyle.solid,
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12.withOpacity(0.2),
              offset: Offset(4.0, 6.0),
              blurRadius: 12 * 0.66,
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
