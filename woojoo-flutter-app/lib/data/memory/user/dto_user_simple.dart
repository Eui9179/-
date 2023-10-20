import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_user_simple.freezed.dart';
part 'dto_user_simple.g.dart';

@unfreezed
class UserSimple with _$UserSimple {
  factory UserSimple({
    @Default(0)
    final int id,
    @Default("")
    String name,
    @Default("")
    @JsonKey(name: 'profile_image_name')
    String? profileImageName,
  }) = _UserSimple;

  factory UserSimple.fromJson(Map<String, dynamic> json) =>
      _$UserSimpleFromJson(json);
}
