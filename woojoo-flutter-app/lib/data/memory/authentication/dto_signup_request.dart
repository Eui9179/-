import 'package:dio/dio.dart';

class SignupRequest {
  //TODO dto로 변환
  final Map<String, dynamic> data;

  SignupRequest({required this.data});

  FormData toForm() {
    final FormData formData = FormData.fromMap({
      "file": data["file"] == null
          ? null
          : MultipartFile.fromFile(data["file"].path),
      "name": data["name"],
      "groups": data["groups"][0],
      "detail1": data["detail1"],
      "phone_number": data["phoneNumber"],
      "fcm_token": data["fcmToken"]
    });
    return formData;
  }
}
