import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

typedef StringCallbackFunction = String? Function(String?);

class VerificationCodeInput extends StatelessWidget {
  final StringCallbackFunction validator;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;

  const VerificationCodeInput({
    super.key,
    required this.validator,
    required this.onCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 25,
        color: Color.fromRGBO(255, 255, 255, 1.0),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(168, 168, 168, 1.0),
            width: 3.0,
          ),
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: const Border(
        bottom: BorderSide(
          color: Color.fromRGBO(234, 239, 243, 1),
          width: 3.0,
        ),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(),
    );

    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 30),
      child: Pinput(
        length: 6,
        validator: validator,
        onCompleted: onCompleted,
        onChanged: onChanged,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        autofocus: true,
      ),
    );
  }
}
