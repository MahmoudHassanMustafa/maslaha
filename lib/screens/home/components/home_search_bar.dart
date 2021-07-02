import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchBar extends StatelessWidget {
  final _srchController = TextEditingController();

  final Function()? onPressed;

  HomeSearchBar({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 10, 8, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(0.0, 2.0),
              blurRadius: 1,
            ),
          ]),
      child: TextField(
        onTap: onPressed,
        enabled: true,
        controller: _srchController,
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            'assets/icons/search_icons/search.svg',
            fit: BoxFit.scaleDown,
          ),
          hintText: 'Search service providers.',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
