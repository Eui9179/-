class UserSimple {
  final int id;
  String name;
  String? profileImageName;

  UserSimple({
    this.id = 0,
    this.name = '',
    this.profileImageName,
  });

  UserSimple copyWith(String name, String? profileImageName) {
    return UserSimple(
      id: id,
      name: name,
      profileImageName: profileImageName,
    );
  }

  factory UserSimple.fromJson(Map<String, dynamic> json) {
    return UserSimple(
      id: json['id'],
      name: json['name'],
      profileImageName: json['profile_image_name'],
    );
  }

  set setName(String name) => this.name = name;

  set setProfileImageName(String? profileImageName) =>
      this.profileImageName = profileImageName;
}
