class Game {
  final String name;
  final String? nickname;

  Game({this.name = '', this.nickname});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(name: json['game'], nickname: json['nickname']);
  }

  factory Game.fromString(String game) {
    return Game(name: game);
  }
}