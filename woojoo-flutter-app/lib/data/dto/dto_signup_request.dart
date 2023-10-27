import 'package:dio/dio.dart';

class SignupRequest {
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
      "phoneNumber": data["phoneNumber"],
      "fcmToken": data["fcmToken"]
    });
    return formData;
  }
}
