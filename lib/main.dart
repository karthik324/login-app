import 'package:flutter/material.dart';
import 'package:my_flutter_app/splash_screen.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      title: 'Star Link',
    );
  }
}
