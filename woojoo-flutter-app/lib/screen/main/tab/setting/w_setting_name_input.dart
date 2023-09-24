import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/setting/setting_data.dart';

class SettingNameInput extends StatefulWidget {

  final SettingData settingData;

  const SettingNameInput({super.key, required this.settingData});

  @override
  State<SettingNameInput> createState() => _SettingNameInputState();
}

class _SettingNameInputState extends State<SettingNameInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          TextFormField(
            initialValue: widget.settingData.userName,
            autofocus: false,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.always,
            onSaved: (val) {
              if (val.isNotEmptyAndNotNull) {
                widget.settingData.userName = val!;
              }
            },
            onChanged: (val) {
              if (val.isEmpty) {
                widget.settingData.isName = false;
              } else {
                widget.settingData.isName = true;
                widget.settingData.isNameChanged = true;
              }
            },
            validator: (val) => null,
            style: TextStyle(
              fontSize: 20.0,
              color: context.appColors.text,
            ),
            decoration: InputDecoration(
              fillColor: context.appColors.boxFillColor,
              filled: true,
              labelText: '이름',
              labelStyle: TextStyle(
                color: context.appColors.inputLabel,
                fontSize: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: context.appColors.textField,
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
            ),
          ),
        ],
      ),
    );
  }
}
