import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:woojoo/data/dto/dto_fcm_request.dart';
import 'package:woojoo/data/dto/dto_user_simple.dart';
import 'package:woojoo/data/memory/my_profile/update_my_profile_request.dart';
import 'package:woojoo/data/remote/api/my_profile/my_profile_repository.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

@Singleton(as: MyProfileRepository)
class MyProfileApi implements MyProfileRepository {
  final Dio dio = DioClient.dio;

  @override
  Future<UserSimple> getMyProfile() async {
    final response = await dio.get('/users/me');
    return UserSimple.fromJson(response.data);
  }

  @override
  Future<int> syncFcm(FcmRequest request) async {
    final response = await dio.post(
      '/auth/sync-token',
      data: request.toJson(),
    );
    return response.statusCode ?? 500;
  }

  @override
  Future<String?> updateMyProfile(UpdateMyProfileRequest request) async {
    FormData formData = FormData.fromMap(await request.toJson());
    Response response = await dio.post('/users/setting', data: formData);
    return response.data.toString();
  }
}
