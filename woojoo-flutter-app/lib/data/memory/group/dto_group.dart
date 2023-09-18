class Group {
  final String name;
  final String detail1;

  Group({this.name = '', this.detail1 = ''});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(name: json['name'], detail1: json['detail1']);
  }
}