import 'package:flutter/material.dart';
import 'package:my_flutter_app/login_page.dart';
import 'package:my_flutter_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: Icon(Icons.exit_to_app_sharp))
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 5, bottom: 15, left: 3.5, right: 3.5),
        child: SafeArea(
          child: Expanded(
            child: ListView(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/andromeda 1.jpeg',
                  width: 340,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'Andromeda Galaxy',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'The Andromeda Galaxy is one of the few visible to the unaided eye, appearing as a milky blur. It is located about 2,480,000 light-years from Earth; its diameter is approximately 200,000 light-years; and it shares various characteristics with the Milky Way system.',
                style: GoogleFonts.abel(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/mars 3.webp'),
                radius: 100,
              ),
              Text(
                'Mars',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the "Red Planet"',
                style: GoogleFonts.abel(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/general theory of relativity 5.jpg',
                  width: 340,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'General Theory of Relativity',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "What is general relativity? Essentially, it's a theory of gravity. The basic idea is that instead of being an invisible force that attracts objects to one another, gravity is a curving or warping of space. The more massive an object, the more it warps the space around it.",
                style: GoogleFonts.abel(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/unicorn 2.jpg'),
                radius: 100,
              ),
              Text(
                'Unicorn Black hole',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                '''It is located about 1,500 light years from Earth.
Scientists have discovered what may be the smallest-known black hole in the Milky Way galaxy and the closest to our solar system — an object so curious that they nicknamed it 'the Unicorn. ' ... Black holes like this one form when massive stars die and their cores collapse''',
                style: GoogleFonts.abel(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/time travel 6.jpg',
                  width: 340,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'Time Travel',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Time travel is theoretically possible, new calculations show. ... Time travel is possible based on the laws of physics, according to new calculations from researchers at the University of Queensland. But time-travelers wouldn't be able to alter the past in a measurable way, they say — the future would stay the same",
                style: GoogleFonts.abel(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  signOut(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LoginScreeen()), (route) => false);
  }
}
