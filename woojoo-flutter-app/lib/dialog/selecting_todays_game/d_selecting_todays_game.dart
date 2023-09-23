import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/data/memory/game/game_data.dart';
import 'package:woojoo/data/memory/game/game_setting/vo_game_selection.dart';
import 'package:woojoo/data/memory/game/todays_game/dto_todays_game_request.dart';
import 'package:woojoo/data/memory/game/todays_game/todays_game_data.dart';
import 'package:woojoo/dialog/selecting_todays_game/w_game_circle_button.dart';
import 'package:woojoo/dialog/selecting_todays_game/w_selecting_todays_game_description_input.dart';
import 'package:woojoo/dialog/selecting_todays_game/w_selecting_todays_game_title.dart';

import '../../common/widget/w_height.dart';

TodaysGameDataProvider dataProvider = TodaysGameDataProvider();

Future<void> showSelectingTodaysGame(
  BuildContext context,
) async {
  final myGameList = Get.find<GameData>().myGameList;
  if (myGameList.isEmpty) return;

  final selectableGames =
      myGameList.map((game) => GameSelection(name: game.name)).toList();

  int lastSelectedIndex = -1;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? description;

  return showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        backgroundColor: context.appColors.mainBackgroundColor,
        contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20),
        actionsAlignment: MainAxisAlignment.spaceAround,
        title: const SelectingTodaysGameTitle(),
        content: SizedBox(
          width: 130,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                  children: List.generate(
                    selectableGames.length,
                    (index) => GameCircleButton(
                      onTap: () => setState(() {
                        lastSelectedIndex = _toggleGameCircleButton(
                          lastSelectedIndex,
                          index,
                          selectableGames,
                        );
                      }),
                      gameName: selectableGames[index].name,
                      isSelect: selectableGames[index].isSelected,
                    ),
                  ),
                ),
              ),
              height20,
              SelectingTodaysGameDescriptionInput(
                formKey: formKey,
                onChanged: (val) {
                  description = val;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              '닫기',
              style: TextStyle(
                color: context.appColors.text,
                fontSize: FontSize.dialogTitle,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (lastSelectedIndex < 0) {
                Get.back();
              }
              _onPressed(
                dataProvider,
                selectableGames[lastSelectedIndex].name,
                description,
              );
            },
            child: Text(
              '완료',
              style: TextStyle(
                color: context.appColors.textButton,
                fontSize: FontSize.dialogTitle,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

int _toggleGameCircleButton(
  int lastSelectedIndex,
  int index,
  List<GameSelection> selectableGames,
) {
  if (lastSelectedIndex > -1 && lastSelectedIndex != index) {
    selectableGames[lastSelectedIndex].isSelected = false;
  }
  selectableGames[index].isSelected = !selectableGames[index].isSelected;

  if (selectableGames[index].isSelected) {
    lastSelectedIndex = index;
  } else {
    lastSelectedIndex = -1;
  }
  return lastSelectedIndex;
}

_onPressed(
  TodaysGameDataProvider dataProvider,
  String game,
  String? description,
) {
  dataProvider.todaysGameData.insertTodaysGame(
    TodaysGameRequest(
      game: game,
      description: description,
    ),
  );
  Get.back();
}