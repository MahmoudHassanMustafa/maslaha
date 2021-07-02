import 'package:flutter/material.dart';
import '../../widgets/service_provider_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              '4 Results for Sara Ortiz',
              style: TextStyle(fontWeight: FontWeight.w600),
            )),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ServiceProviderCard(
                profilePicUrl:
                    'https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
                status: {'text': 'Online', 'color': Colors.green},
                userName: 'Sara Ortiz',
                rating: 3.5,
                service: 'Baby-Sitter',
                distanceAway: 3,
                startingPrice: 100,
                isFav: index % 2 == 0 ? true : false,
              );
            },
          ),
        ),
      ],
    );
  }
}
