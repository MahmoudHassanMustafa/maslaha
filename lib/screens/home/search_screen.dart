import 'package:flutter/material.dart';
import '../../providers/search_result.dart';
import 'package:provider/provider.dart';
import '../../widgets/service_provider_card.dart';

enum SortOption { PriceAsc, PriceDesc, MostRated, Popularity }

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var searchResults = Provider.of<SearchResult>(context).serviceProviders;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${searchResults.length} Results found.',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                PopupMenuButton(
                    icon: Icon(
                      Icons.sort_rounded,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onSelected: (selectedOption) {
                      switch (selectedOption) {
                        case SortOption.Popularity:
                          print('popularity');
                          break;
                        case SortOption.MostRated:
                          print('most rated');
                          break;
                        case SortOption.PriceDesc:
                          print('highest price');
                          break;
                        case SortOption.PriceAsc:
                          print('lowest price');
                          break;
                        default:
                          break;
                      }
                    },
                    itemBuilder: (ctx) {
                      return [
                        PopupMenuItem(
                          child: Text('Most Popular'),
                          value: SortOption.Popularity,
                        ),
                        PopupMenuItem(
                          child: Text('Most Rated'),
                          value: SortOption.MostRated,
                        ),
                        PopupMenuItem(
                          child: Text('Highest price'),
                          value: SortOption.PriceDesc,
                        ),
                        PopupMenuItem(
                          child: Text('Lowest Price'),
                          value: SortOption.PriceAsc,
                        ),
                      ];
                    }),
              ],
            )),
        Expanded(
          child: searchResults.isEmpty
              ? Center(
                  child: Text('No result yet!'),
                )
              : ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return ServiceProviderCard(
                      id: searchResults[index].id,
                      userName: searchResults[index].name,
                      profilePicUrl: searchResults[index].profileImg,
                      status: searchResults[index].stauts,
                      rating: searchResults[index].rating,
                      service: searchResults[index].serviceName,
                      distanceAway:
                          searchResults[index].distanceAway.toDouble(),
                      startingPrice:
                          searchResults[index].initialPrice.toDouble(),
                      isFav: searchResults[index].isFav,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
