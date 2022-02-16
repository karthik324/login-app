import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_flutter_app/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class LoginScreeen extends StatefulWidget {
  LoginScreeen({Key? key}) : super(key: key);

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  final _usernameCtrl = TextEditingController();

  final _passwordCtrl = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white70, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: _usernameCtrl,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Username'),
                      validator: (val) {
                        if (val == "") {
                          return 'Name cannot be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  TextFormField(
                    controller: _passwordCtrl,
                    style: TextStyle(color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.black,
                        border: OutlineInputBorder(),
                        labelText: 'Password'),
                    validator: (val) {
                      if (val == "") {
                        return 'Password cannot be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            checkLogin(context);
                          } else {
                            print('Data empty');
                          }

                          // checkLogin(context);
                        },
                        child: const Text('Login')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameCtrl.text;
    final _password = _passwordCtrl.text;

    if (_username == '12345' && _password == '11111') {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      // SchedulerBinding.instance!.addPostFrameCallback((_) {
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => HomeScreen()));
      // });

      // Navigator.of(ctx).pushReplacement(MaterialPageRoute(
      //   builder: (ctx1) => HomeScreen(),
      // ));
      // });
      //goto home
    } else {
      // TextFormField(
      //   decoration: InputDecoration(
      //       focusedBorder:
      //           OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      // );
      //show text
      final errorMsg = "Username and Password does not match";
      // setState(() {
      //   _isDataMatched = false;
      // });
      //snack bar
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          content: Text(errorMsg)));
    }
  }
}
