import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/data/dto/dto_game_nickname.dart';
import 'package:woojoo/data/memory/game/game_data.dart';
import 'package:woojoo/dialog/d_game_nickname.dart';
import 'package:woojoo/utils/woojoo_games.dart';

class GameCard extends StatefulWidget {
  const GameCard({
    Key? key,
    required this.gameName,
    required this.isMe,
    required this.nickname,
  }) : super(key: key);

  final String gameName;
  final String? nickname;
  final bool isMe;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> with GameDataProvider {
  final _textFieldController = TextEditingController();
  String? nickname;

  @override
  void initState() {
    nickname = widget.nickname;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isMe) Get.toNamed('/friends/${widget.gameName}');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 8.0, top: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black87.withOpacity(0.2),
                BlendMode.srcOver,
              ),
              child: Container(
                width: 150,
                height: 230,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/game/${widget.gameName}.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                      stops: [0.0, 0.5, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (widget.isMe) {
                          showUpdateGameNicknameDialog(
                            context,
                            widget.gameName,
                            _textFieldController,
                            _updateGameNickname,
                          );
                        }
                      },
                      child: Text(
                        nickname == null
                            ? (widget.isMe ? '닉네임 등록하기' : '')
                            : nickname!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1, 0),
                                blurRadius: 5.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            backgroundColor: Color.fromARGB(89, 0, 0, 0)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      changeKorGameName(widget.gameName), // .jpg, .png 없애는 함수
                      style: const TextStyle(
                        color: Color.fromARGB(255, 199, 199, 199),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            if (widget.isMe)
              Positioned(
                top: 7,
                right: 5,
                child: Material(
                  color: const Color.fromARGB(0, 255, 255, 255),
                  child: IconButton(
                      onPressed: () {
                        showUpdateGameNicknameDialog(
                          context,
                          widget.gameName,
                          _textFieldController,
                          _updateGameNickname,
                        );
                      },
                      tooltip: "닉네임 설정",
                      splashRadius: 14,
                      padding: const EdgeInsets.all(3.0),
                      constraints: const BoxConstraints(),
                      splashColor: const Color.fromARGB(169, 255, 255, 255),
                      icon: const Icon(
                        Icons.settings,
                        color: Color.fromARGB(178, 255, 255, 254),
                        size: 20,
                      )),
                ),
              ),
          ]),
        ),
      ),
    );
  }

  _updateGameNickname() {
    gameData.updateGameNickname(GameNickname(
      game: widget.gameName,
      nickname: _textFieldController.text,
    ));
    setState(() => nickname = _textFieldController.text);
  }
}
