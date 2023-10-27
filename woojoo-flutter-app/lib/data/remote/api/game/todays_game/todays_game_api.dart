import 'package:dio/dio.dart';
import 'package:woojoo/data/dto/dto_todays_game.dart';
import 'package:woojoo/data/dto/dto_todays_game_request.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

import 'todays_game_repository.dart';

class TodaysGameApi implements TodaysGameRepository {
  final Dio _dio = DioClient.dio;

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