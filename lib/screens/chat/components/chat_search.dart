import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/conversations.dart';
import '../../../utils/size_config.dart';

class ChatSearch extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(getProportionateScreenHeight(65));

  @override
  _ChatSearchState createState() => _ChatSearchState();
}

class _ChatSearchState extends State<ChatSearch> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          Provider.of<Conversations>(context, listen: false)
              .searchConversationList(value);
        },
        onSubmitted: (_) {
          FocusScope.of(context).unfocus();
          _controller.clear();
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.3),
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.only(left: 15),
          suffixIcon: const Icon(Icons.person_search_rounded),
        ),
      ),
    );
  }
}
