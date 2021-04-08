import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../app_drawer/components/app_drawer_footer.dart';
import '../app_drawer/components/app_drawer_header.dart';
import '../app_drawer/components/navigation_tabs.dart';
import '../app_drawer/components/reside_menu_package.dart';

class AppDrawer extends StatefulWidget {
  final Widget? child;

  AppDrawer({this.child});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with TickerProviderStateMixin {
  late final MenuController _menuController =
      MenuController(vsync: this, openDuration: kAnimationDuration);

  @override
  void dispose() {
    _menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResideMenu.scaffold(
      controller: _menuController,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF107AD6), Color(0xFF083D6B)],
        ),
      ),
      leftScaffold: MenuScaffold(
        topMargin: 30.0,
        header: AppDrawerHeader(),
        children: NavigationTabs(),
        footer: AppDrawerFooter(),
      ),
      enableFade: false,
      child: widget.child!,
    );
  }
}
