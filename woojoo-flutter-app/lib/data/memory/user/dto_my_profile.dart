import 'package:dio/dio.dart';

class MyProfile {
  final String name;
  final String? profileImageName;
  final int statusCode;

  MyProfile({
    required this.name,
    required this.profileImageName,
    required this.statusCode,
  });

  factory MyProfile.fromJson(Response response) {
    return MyProfile(
      name: response.data['name'],
      profileImageName: response.data['profileImageName'],
        statusCode: response.statusCode ?? 500,
    );
  }
}
