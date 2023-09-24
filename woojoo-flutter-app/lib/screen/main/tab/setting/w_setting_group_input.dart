import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/setting/setting_data.dart';

import '../../../../common/theme/font_size.dart';
import '../../../../utils/woojoo_groups.dart';

class SettingGroupInput extends StatefulWidget {
  final SettingData settingData;
  final TextEditingController typeAheadController;

  const SettingGroupInput({
    super.key,
    required this.settingData,
    required this.typeAheadController,
  });

  @override
  State<SettingGroupInput> createState() => _SettingGroupInputState();
}

class _SettingGroupInputState extends State<SettingGroupInput> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        textInputAction: TextInputAction.next,
        style: TextStyle(fontSize: 20.0, color: context.appColors.text),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 52, 52, 71),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          fillColor: const Color.fromARGB(255, 62, 62, 75),
          filled: true,
          labelText: "학교",
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 206, 206, 215),
            fontSize: 20,
          ),
        ),
        controller: widget.typeAheadController,
        onChanged: (val) {
          if (val.isEmpty || !WoojooGroups.states.contains(val)) {
            widget.settingData.isGroup = false;
          } else if (WoojooGroups.states.contains(val)) {
            widget.settingData.groupName = val;
            widget.settingData.isGroup = true;
            widget.settingData.isGroupChanged = true;
          }
        },
      ),
      suggestionsCallback: (pattern) {
        return WoojooGroups.getSuggestions(pattern);
      },
      transitionBuilder: (context, suggestionsBox, controller) {
        return suggestionsBox;
      },
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        color: context.appColors.boxFillColor,
      ),
      itemBuilder: (context, suggestion) {
        return ListTile(
          tileColor: context.appColors.boxFillColor,
          title:
              suggestion.toString().text.color(context.appColors.text).make(),
        );
      },
      noItemsFoundBuilder: (value) {
        return Container(
          padding: const EdgeInsets.only(top: 13, bottom: 13, left: 13),
          child: '검색 결과가 없습니다.'
              .text
              .size(FontSize.subTitle)
              .color(context.appColors.text)
              .make(),
        );
      },
      onSuggestionSelected: (suggestion) {
        widget.typeAheadController.text = suggestion.toString();
        widget.settingData.groupName = widget.typeAheadController.text;
        widget.settingData.isGroup = true;
        widget.settingData.isGroupChanged = true;
      },
    );
  }
}
