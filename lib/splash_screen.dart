import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_flutter_app/home_page.dart';
import 'package:my_flutter_app/login_page.dart';
import 'package:my_flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/splash logo.jpg',
          height: 400,
          width: 400,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    // Future.delayed(Duration.zero);
    //   SchedulerBinding.instance!.addPostFrameCallback((_) {
    //     Future.delayed(Duration(seconds: 3)){
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (ctx) => ScreenLogin()));

    // }
    Future.delayed(const Duration(seconds: 3));
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreeen()));
    });
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);

    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => HomeScreen()));
    }
  }
}
