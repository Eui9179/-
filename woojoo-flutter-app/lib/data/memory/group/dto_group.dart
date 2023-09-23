class Group {
  String name;
  String detail1;

  Group({this.name = '', this.detail1 = ''});

  Group copyWith(String name, String detail1) {
    return Group(name: name, detail1: detail1);
  }

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(name: json['name'], detail1: json['detail1']);
  }
}