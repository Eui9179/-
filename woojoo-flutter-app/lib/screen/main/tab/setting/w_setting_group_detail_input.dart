import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/setting/setting_data.dart';

class SettingGroupDetailInput extends StatefulWidget {
  final SettingData settingData;
  const SettingGroupDetailInput({super.key, required this.settingData});

  @override
  State<SettingGroupDetailInput> createState() => _SettingGroupDetailInputState();
}

class _SettingGroupDetailInputState extends State<SettingGroupDetailInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      height: 60,
      child: InputDecorator(
        decoration: InputDecoration(
          fillColor: context.appColors.boxFillColor,
          filled: true,
          labelText: '학년을 입력해주세요',
          labelStyle: TextStyle(
            color: context.appColors.text,
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 52, 52, 71),
              width: 2,
            ),
          ),
        ),
        child: DropdownButton(
          value: widget.settingData.groupDetail,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: TextStyle(color: context.appColors.text),
          isExpanded: true,
          dropdownColor: context.appColors.boxFillColor,
          underline: Container(
            height: 2,
          ),
          onChanged: (String? newValue) {
            widget.settingData.groupDetail = newValue!;
            widget.settingData.isGroupChanged = true;
          },
          items: _generateDetailDropMenu(),
        ),
      ),
    );
  }

  _generateDetailDropMenu() {
    return widget.settingData.groupName.isEmpty ||
        widget.settingData.groupName.contains("초등학교")
        ? ['1', '2', '3', '4', '5', '6']
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(
    value,
    style: const TextStyle(fontSize: 20),
    ),
    );
    }).toList()
        : ['1', '2', '3'].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value, style: const TextStyle(fontSize: 20)),
    );
    }).toList();
  }
}
