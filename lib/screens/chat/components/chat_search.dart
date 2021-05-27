import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/conversations.dart';

class ChatSearch extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: TextField(
        onChanged: (value) {
          Provider.of<Conversations>(context, listen: false)
              .searchConversationList(value);
        },
        onSubmitted: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.person_search_rounded),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey[600],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade300,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 6,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
