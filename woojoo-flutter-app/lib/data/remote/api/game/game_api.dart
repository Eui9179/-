import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:woojoo/data/dto/dto_game.dart';
import 'package:woojoo/data/dto/dto_game_nickname.dart';
import 'package:woojoo/data/remote/api/game/game_repository.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

@Singleton(as: GameRepository)
class GameApi implements GameRepository {
  Dio dio = DioClient.dio;

  @override
  Future<List<Game>> getMyGameList() async {
    final response = await dio.get<List>('/games/me');
    return convertJsonToGameList(response);
  }

  @override
  Future<List<Game>> updateMyGameList(List<String> gameList) async {
    final response = await dio.post<List>("/games", data: jsonEncode(gameList));
    return convertJsonToGameList(response);
  }

  List<Game> convertJsonToGameList(Response<List> response) {
    return response.data?.map((game) => Game.fromJson(game)).toList() ?? [];
  }

  @override
  Future<void> updateGameNickname(GameNickname gameNickname) async {
    await dio.post(
      "/games/nickname",
      data: gameNickname,
    );
  }
}
