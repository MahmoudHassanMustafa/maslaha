import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/size_config.dart';
import '../../../shared/constants.dart';
import '../../../screens/chat/chat_screen.dart';

class NavigationTabs extends StatefulWidget {
  @override
  _NavigationTabsState createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  int _activeTab = 0;
  final List<Map<String, String>> tabs = const [
    {
      "label": "Home",
      "icon": 'assets/icons/drawer_tabs/home.svg',
      "routeName": '',
    },
    {
      "label": "Chat",
      "icon": 'assets/icons/drawer_tabs/chat.svg',
      "routeName": ChatScreen.routeName,
    },
    {
      "label": "Provide a service",
      "icon": 'assets/icons/drawer_tabs/service.svg',
      "routeName": '',
    },
    {
      "label": "Favourites",
      "icon": 'assets/icons/drawer_tabs/heart.svg',
      "routeName": '',
    },
    {
      "label": "Orders",
      "icon": 'assets/icons/drawer_tabs/service_pack.svg',
      "routeName": '',
    },
    {
      "label": "Make complains",
      "icon": 'assets/icons/drawer_tabs/dislike.svg',
      "routeName": '',
    },
    {
      "label": "About",
      "icon": 'assets/icons/drawer_tabs/about.svg',
      "routeName": '',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemExtent: 50,
      itemCount: tabs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _activeTab = index;
            });
            var route = tabs[index]['routeName'] as String;
            if (route.isNotEmpty) Navigator.pushNamed(context, route);
          },
          child: AnimatedContainer(
            duration: kAnimationDuration,
            curve: Curves.easeInOutSine,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: _activeTab == index
                  ? LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                          Colors.white24.withOpacity(0.15),
                          Colors.white10.withOpacity(0.0)
                        ])
                  : null,
            ),
            child: Row(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return AnimatedContainer(
                      duration: kAnimationDuration,
                      alignment: Alignment.center,
                      curve: Curves.easeInOutSine,
                      margin: const EdgeInsets.only(right: 10.0),
                      width: 4.0,
                      height:
                          _activeTab == index ? constraints.biggest.height : 0,
                      decoration: BoxDecoration(
                        color: _activeTab == index
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    );
                  },
                ),
                SvgPicture.asset(
                  tabs[index]['icon'] as String,
                  color: _activeTab == index ? Colors.white : Colors.white54,
                  height: getProportionateScreenHeight(52),
                  width: getProportionateScreenWidth(52),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    tabs[index]['label'] as String,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color:
                          _activeTab == index ? Colors.white : Colors.white54,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
