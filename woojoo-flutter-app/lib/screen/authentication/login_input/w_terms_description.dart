import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsDescription extends StatelessWidget {
  const TermsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: "로그인 및 회원가입을 하면 우주 ",
          style: TextStyle(
            fontSize: 13,
            color: Color.fromARGB(255, 172, 172, 172),
          ),
        ),
        TextSpan(
            text: "이용약관",
            style: const TextStyle(
              fontSize: 13,
              color: Colors.blueAccent,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _onTapTOSLaunch();
              }),
        const TextSpan(
          text: "에 동의하는 것으로 간주 됩니다. "
              "우주의 회원 정보 처리방식은 개인정보 처리 방침 및 쿠키 정책을 확인해 보세요. "
              "계속하기를 누르면 인증코드를 문자 메시지로 전송합니다. "
              "인증이 완료된 전화번호는 우주에 로그인 할 수 있습니다.",
          style: TextStyle(
            fontSize: 13,
            color: Color.fromARGB(255, 172, 172, 172),
          ),
        ),
        TextSpan(
            text: "개인정보 처리 방침",
            style: const TextStyle(
              fontSize: 13,
              color: Colors.blueAccent,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _onTapTOSLaunch();
              }),
        const TextSpan(
          text: " 및 ",
          style: TextStyle(
            fontSize: 13,
            color: Color.fromARGB(255, 172, 172, 172),
          ),
        ),
        TextSpan(
            text: "쿠키 정책",
            style: const TextStyle(
              fontSize: 13,
              color: Colors.blueAccent,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _onTapTOSLaunch();
              }),
        const TextSpan(
          text: "을 확인해 보세요. "
              "계속하기를 누르면 인증코드를 문자 메시지로 전송합니다. "
              "인증이 완료된 전화번호는 우주에 로그인 할 수 있습니다.",
          style: TextStyle(
            fontSize: 13,
            color: Color.fromARGB(255, 172, 172, 172),
          ),
        ),
      ]),
    );
  }

  void _onTapTOSLaunch() => launchUrl(Uri.parse(''));
}
