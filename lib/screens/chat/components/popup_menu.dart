import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  final Function(dynamic) onSelection;
  final List<PopupMenuItem> menuItems;
  const PopupMenu({
    required this.onSelection,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(
          Icons.more_vert_rounded,
          color: Colors.grey,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onSelected: onSelection,
        itemBuilder: (ctx) {
          return menuItems;
        });
  }
}
