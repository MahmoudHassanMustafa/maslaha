import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../screens/chat/chat_screen.dart';
import '../../../shared/constants.dart';
import '../../favourites/favourites_screen.dart';
import '../../home/home_screen.dart';

class NavigationTabs extends StatefulWidget {
  @override
  _NavigationTabsState createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  int _activeTab = 0;
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> tabs = [
      {
        "label": "Home",
        "icon": 'assets/icons/drawer_icons/home.svg',
        "routeName": HomeScreen.routeName,
      },
      {
        "label": "Profile",
        "icon": 'assets/icons/drawer_icons/user.svg',
        'routeName': '',
      },
      {
        "label": "Chat",
        "icon": 'assets/icons/drawer_icons/chat-bubble.svg',
        "routeName": ChatScreen.routeName,
      },
      {
        "label": "Provide a service",
        "icon": 'assets/icons/drawer_icons/edit.svg',
        "routeName": '',
      },
      {
        "label": "Favourites",
        "icon": 'assets/icons/drawer_icons/heart.svg',
        "routeName": FavouritesScreen.routeName,
      },
      {
        "label": "Orders",
        "icon": 'assets/icons/drawer_icons/credit-card.svg',
        "routeName": '',
      },
      {
        "label": "Make complains",
        "icon": 'assets/icons/drawer_icons/thumbs-down.svg',
        "routeName": '',
      },
      {
        "label": "About",
        "icon": 'assets/icons/drawer_icons/information-circle.svg',
        "routeName": '',
      },
    ];
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
            var route = tabs[_activeTab]['routeName'] as String;
            if (route.isNotEmpty)
              Navigator.pushNamed(context, route);
            else {
              setState(() {
                _activeTab = 0;
              });
              Navigator.pushReplacementNamed(
                  context, tabs[_activeTab]['routeName'] as String);
            }
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
                  color: _activeTab == index ? Colors.white : null,
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
