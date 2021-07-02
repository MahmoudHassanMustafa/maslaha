import 'package:flutter/material.dart';

class TopWorker {
  final String id;
  final String name;
  final String profilePic;
  final String gender;
  final String serviceName;
  final num rating;
  String status;
  bool isFav;

  TopWorker({
    required this.id,
    required this.name,
    required this.gender,
    required this.profilePic,
    required this.serviceName,
    required this.rating,
    required this.status,
    this.isFav = false,
  });

  Map<String, Object> statusParser() {
    late var status;
    switch (this.status) {
      case 'online':
        status = {'text': 'Online', 'color': Colors.green};
        break;
      case 'busy':
        status = {'text': 'Busy', 'color': Colors.yellow};
        break;
      case 'offline':
        status = {'text': 'Offline', 'color': Colors.red};
        break;
      default:
        status = {'text': 'Offline', 'color': Colors.red};
        break;
    }
    return status;
  }
}
