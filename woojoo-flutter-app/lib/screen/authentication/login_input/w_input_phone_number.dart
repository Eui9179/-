import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_input_data.dart';

class InputPhoneNumber extends StatefulWidget {
  const InputPhoneNumber({super.key});

  @override
  State<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber>
    with LoginInputDataProvider {
  final enabledBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  );
  final focusedBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty || value.length != 8) {
            return "전화번호 번호 8자리 입력";
          }
          return null;
        },
        onSaved: (val) {
          setState(() {
            inputData.phoneNumber = "010$val";
          });
        },
        onChanged: (val) {
          val.length == 8
              ? inputData.activeButton()
              : inputData.disableButton();
        },
        style:
            const TextStyle(fontSize: 30.0, height: 2.0, color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          prefixStyle: const TextStyle(color: Colors.white, fontSize: 30),
          prefixText: "010 ",
        ),
        cursorColor: Colors.blueAccent,
      ),
    );
  }
}
