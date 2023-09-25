class TodaysGame {
  final int id;
  final int userId;
  final String userName;
  final String? profileImageName;
  final String gameName;
  final String? gameNickname;
  final String createdTime;
  final String? description;
  final bool isMe;

  TodaysGame({
    required this.id,
    required this.userId,
    required this.userName,
    required this.profileImageName,
    required this.gameName,
    required this.gameNickname,
    required this.createdTime,
    required this.description,
    required this.isMe,
  });

  factory TodaysGame.fromJson(Map<String, dynamic> json) {
    return TodaysGame(
      id: json['todays_game_id'],
      userId: json['id'],
      userName: json['name'],
      profileImageName: json['profile_image_name'],
      gameName: json['game'],
      gameNickname: json['game_nickname'],
      createdTime: json['create_time'],
      description: json['introduction'],
      isMe: json['isme'],
    );

    ///  todaysGameList[index]['id'],
    // todaysGameList[index]['todays_game_id'],
    // todaysGameList[index]['profile_image_name'],
    // todaysGameList[index]['name'],
    // todaysGameList[index]['create_time'],
    // todaysGameList[index]['game'],
    // todaysGameList[index]['game_nickname'],
    // todaysGameList[index]['description'],
    // todaysGameList[index]['isme'],
  }
}
