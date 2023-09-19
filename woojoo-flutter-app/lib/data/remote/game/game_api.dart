import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/game/dto_game.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';
import 'package:woojoo/data/remote/game/game_repository.dart';

class GameApi with AccessTokenDataProvider implements GameRepository {
  Dio dio = DioInstance(accessToken: Get.find<AccessTokenData>().accessToken).dio;

  GameApi._();

  static GameRepository instance = GameApi._();

  @override
  Future<List<Game>> getMyGameList() async {
    final response = await dio.get<List>('/games/me');
    return response.data?.map((game) => Game.fromJson(game)).toList() ?? [];

  }
}