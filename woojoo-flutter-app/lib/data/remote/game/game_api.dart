import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/game/dto_game.dart';
import 'package:woojoo/data/remote/dio_instance.dart';
import 'package:woojoo/data/remote/game/game_repository.dart';

class GameApi implements GameRepository {
  Dio dio = DioInstance(accessToken: g.Get.find<AccessTokenData>().accessToken).dio;

  GameApi._();

  static GameRepository instance = GameApi._();

  @override
  Future<List<Game>> getMyGameList() async {
    final response = await dio.get<List>('/games/me');
    return convertJsonToGameList(response);
  }

  @override
  Future<List<Game>> updateMyGameList(List<String> gameList) async {
    final response =  await dio.post<List>("/games", data: jsonEncode(gameList));
    return convertJsonToGameList(response);
  }

  List<Game> convertJsonToGameList(Response<List> response) {
    return response.data?.map((game) => Game.fromJson(game)).toList() ?? [];
  }
}