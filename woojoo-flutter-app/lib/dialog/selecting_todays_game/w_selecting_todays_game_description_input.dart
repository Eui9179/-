import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';

class SelectingTodaysGameDescriptionInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> onChanged;

  const SelectingTodaysGameDescriptionInput({super.key, required this.formKey, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLength: 50,
        maxLines: 3,
        minLines: 3,
        onChanged: onChanged,
        validator: (val) => null,
        style: TextStyle(fontSize: 17.0, color: context.appColors.text),
        decoration: InputDecoration(
          counterStyle: TextStyle(color: context.appColors.subText),
          fillColor: const Color.fromARGB(255, 62, 62, 75),
          filled: true,
          labelText: '메모',
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 206, 206, 215),
            fontSize: 17,
          ),
          alignLabelWithHint: true,
          hintText: '저녁 7시에 게임할 사람!',
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 206, 206, 215),
            fontSize: 16,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: context.appColors.textField,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: context.appColors.textButton,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
