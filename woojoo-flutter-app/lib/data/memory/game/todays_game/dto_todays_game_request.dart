class TodaysGameRequest {
  final String game;
  final String? description;

  TodaysGameRequest({required this.game, required this.description});

  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      'game': game,
      'description': description,
    };
  }
}