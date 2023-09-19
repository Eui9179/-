
class UserSimple {
  final int id;
  final String name;
  final String? profileImageName;

  UserSimple({
    this.id = 0,
    this.name = '',
    this.profileImageName,
  });

  factory UserSimple.fromJson(Map<String, dynamic> json) {
    return UserSimple(
      id: json['id'],
      name: json['name'],
      profileImageName: json['profileImageName'],
    );
  }
}
