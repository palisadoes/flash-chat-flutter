import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter/components/rounded_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {
        // print(animation.value);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller.value * 100,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                ])
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
