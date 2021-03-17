import 'package:maslaha/components/app_drawer/components/app_drawer_footer.dart';
import 'package:maslaha/components/app_drawer/components/app_drawer_header.dart';
import 'package:maslaha/components/app_drawer/components/navigation_tabs.dart';
import 'package:maslaha/shared/constants.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'components/reside_menu_package.dart';

class AppDrawer extends StatefulWidget {
  final Widget? child;

  AppDrawer({this.child});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with TickerProviderStateMixin {
  MenuController? _menuController;

  @override
  void initState() {
    super.initState();
    _menuController =
        MenuController(vsync: this, openDuration: kAnimationDuration);
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
