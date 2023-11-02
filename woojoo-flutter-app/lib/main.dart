// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:woojoo/app.dart';
import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/common/theme/color_palette.dart';
import 'package:woojoo/pages.dart';

// import 'firebase_options.dart';

const storage = FlutterSecureStorage();
// Future<void> _messageHandler(RemoteMessage message) async {
//   print('background message ${message.notification!.body}');
// }

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: const ColorPalette().headerBackgroundColor,
  ));
  final ensureInitialized = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: ensureInitialized);
  setUp();

  // await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseMessaging.onBackgroundMessage(_messageHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const App(),
      initialRoute: '/',
      getPages: pages,
    );
  }
}
