import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/game/todays_game/dto_todays_game.dart';
import 'package:woojoo/data/memory/game/todays_game/dto_todays_game_request.dart';
import 'package:woojoo/data/remote/dio_instance.dart';
import 'package:woojoo/data/remote/game/todays_game/todays_game_repository.dart';

class TodaysGameApi implements TodaysGameRepository {
  final Dio _dio =
      DioInstance(accessToken: Get.find<AccessTokenData>().accessToken).dio;

  TodaysGameApi._();

  static TodaysGameRepository instance = TodaysGameApi._();

  @override
  Future<void> insertTodaysGames(TodaysGameRequest request) async {
    await _dio.post("/games/todays", data: request.toJson());
  }

  @override
  Future<List<TodaysGame>> getTodaysGames() async {
    final response = await _dio.get<List>('/games/todays');
    if (response.data == null) return [];
    return response.data!.map((res) => TodaysGame.fromJson(res)).toList();
  }

  @override
  Future<void> deleteTodaysGames(int id) async {
    await _dio.delete('/games/todays/$id');
  }
}
