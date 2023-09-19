class Game {
  final String game;
  final String? nickname;

  Game({this.game = '', this.nickname});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(game: json['game'], nickname: json['nickname']);
  }

  factory Game.fromString(String game) {
    return Game(game: game);
  }
}