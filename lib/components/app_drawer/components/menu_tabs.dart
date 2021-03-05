import 'package:maslaha/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuTabs extends StatefulWidget {
  @override
  _MenuTabsState createState() => _MenuTabsState();
}

class _MenuTabsState extends State<MenuTabs> {
  int _activeTab = 0;
  List<Map<String, dynamic>> tabs = [
    {
      "label": "Home",
      "icon": Icons.home,
      "routeName": '',
    },
    {
      "label": "Chat",
      "icon": Icons.chat_rounded,
      "routeName": '',
    },
    {
      "label": "Redeem a service",
      "icon": Icons.app_registration,
      "routeName": '',
    },
    {
      "label": "Favourites",
      "icon": Icons.favorite,
      "routeName": '',
    },
    {
      "label": "Orders",
      "icon": Icons.history,
      "routeName": '',
    },
    {
      "label": "Make complains",
      "icon": FontAwesomeIcons.thumbsDown,
      "routeName": '',
    },
    {
      "label": "About",
      "icon": Icons.info,
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

            // Navigator.pushNamed(context, tabs[index]['routeName']);
          },
          child: AnimatedContainer(
            duration: kAnimationDuration,
            curve: Curves.easeInOutSine,
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.07,
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
                      margin: EdgeInsets.only(right: 10.0),
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
                Icon(
                  tabs[index]['icon'],
                  color: _activeTab == index ? Colors.white : Colors.white54,
                  size: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Text(
                    tabs[index]['label'],
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
