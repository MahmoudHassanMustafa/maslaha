import 'dart:convert';
import 'package:flutter/widgets.dart';
import '../models/service_provider_overview_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum SortOptions { PriceAsc, PriceDesc, MostRated, Popularity, Nearest }

class SearchResult with ChangeNotifier {
  List<ServiceProviderOverview> _serviceProviders = [];
  String currentSortOption = 'popularity';
  String searchKeyword = '';

  List<ServiceProviderOverview> get serviceProviders {
    return [..._serviceProviders];
  }

  search(
    String searchKeyword, {
    String? sort,
    int? fixedPrice,
    int? startPrice,
    int? endPrice,
    int? distance,
    double? rating,
  }) async {
    var userPrefs = await SharedPreferences.getInstance();
    var currentToken = userPrefs.getString('token');

    var url = Uri.https('masla7a.herokuapp.com', '/home/search/', {
      'search': searchKeyword,

      // 'sort': 'price_desc',
      // 'price_from': startPrice ?? '',
      // 'price_to': fixedPrice != null ? fixedPrice : endPrice,
      // 'distance': distance,
      // 'rating': rating,
      // 'price_from': 1800,
      // 'price_to': 3000,
    });
    var response =
        await http.get(url, headers: {'x-auth-token': '$currentToken'});

    var resBody = json.decode(response.body);

    print(sort);
    print('response body:\n $resBody');
    print('keyword: $searchKeyword');

    if (response.statusCode == 200) {
      _serviceProviders.replaceRange(
          0,
          _serviceProviders.length,
          resBody['serviceProviders'].map(
            (serviceProvider) {
              return ServiceProviderOverview(
                id: serviceProvider['_id'],
                name: serviceProvider['name'],
                profileImg: serviceProvider['profilePic'],
                stauts: serviceProvider['availability'],
                isFav: serviceProvider['favourite'],
                distanceAway: double.parse(
                    serviceProvider['distance'].toStringAsFixed(1)),
                rating: serviceProvider['service']['averageRating'].toDouble(),
                serviceName: serviceProvider['service']['serviceName'],
                initialPrice: serviceProvider['service']['servicePrice'],
              );
            },
          ).cast<ServiceProviderOverview>());

      notifyListeners();
    }
    // _serviceProviders
  }

  clearSearchResultList() {
    _serviceProviders.clear();
  }

  updateSortOption(String sortBy) {
    currentSortOption = sortBy;

    notifyListeners();
  }

  updateKeyword(String newKeyword) {
    searchKeyword = newKeyword;

    notifyListeners();
  }
}
