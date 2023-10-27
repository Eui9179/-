import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_group.freezed.dart';
part 'dto_group.g.dart';

@unfreezed
class Group with _$Group {

  factory Group({
    @Default("") String name,
    @Default("") String detail1,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
