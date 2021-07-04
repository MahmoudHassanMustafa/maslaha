import 'dart:io';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:maslaha/models/service_provider_overview_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SearchResult with ChangeNotifier {
  List<ServiceProviderOverview> _serviceProviders = [];

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

    var url = Uri.https('masla7a.herokuapp.com', '/home/search', {
      'search': searchKeyword,
      // 'sort': sort,
      // 'price_from': startPrice,
      // 'price_to': fixedPrice != null ? fixedPrice : endPrice,
      // 'distance': distance,
      // 'rating': rating,
    });
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'x-auth-token' '$currentToken',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    var resBody = await json.decode(response.body);

    print('response body:\n ${resBody['services']}');
    print('keyword: $searchKeyword');

    _serviceProviders.replaceRange(
        0,
        _serviceProviders.length,
        resBody['services'] != null
            ? resBody['services'].map(
                (serviceProvider) {
                  return ServiceProviderOverview(
                    id: serviceProvider['serviceProvider']['_id'],
                    name: serviceProvider['serviceProvider']['name'],
                    profileImg: serviceProvider['serviceProvider']
                        ['profilePic'],
                    stauts: serviceProvider['serviceProvider']['availability'],
                    distanceAway: serviceProvider['distance'],
                    rating: serviceProvider['averageRating'].toDouble(),
                    serviceName: serviceProvider['serviceName'],
                    initialPrice: serviceProvider['servicePrice'],
                    isFav: false,
                  );
                },
              ).cast<ServiceProviderOverview>()
            : []);

    notifyListeners();
  }

  clearSearchResultList() {
    _serviceProviders.clear();
  }
}
