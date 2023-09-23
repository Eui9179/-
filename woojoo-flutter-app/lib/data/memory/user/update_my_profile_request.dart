import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UpdateMyProfileRequest {
  final bool isFile;
  final XFile? file;
  final String? name;
  final bool isGroup;
  final String? groupName;
  final String? groupDetail1;

  UpdateMyProfileRequest({
    required this.isFile,
    required this.file,
    required this.name,
    required this.isGroup,
    required this.groupName,
    required this.groupDetail1,
  });

  Future<Map<String, dynamic>> toJson() async {
    return <String, dynamic>{
      "is_file": isFile,
      "file": file != null ? await MultipartFile.fromFile(file!.path) : null,
      "name": name,
      "group_name": groupName,
      "group_detail1": groupDetail1,
      "is_group": isGroup,
    };
  }
}
