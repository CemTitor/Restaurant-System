import 'package:restaurant_system/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:restaurant_system/components/rounded_button.dart';

class FirstScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  //state mixin ekleyerek welcomescreenstatein ticker provide olarak davranmasını sağlarız.
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      // upperBound: 1.0, //animasyonun büyüklüğü
    );

    //Curved animation kullanırken upperbound 1in üstünde olamaz
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    animation =
        ColorTween(begin: Colors.blueGrey, end: Colors.red).animate(controller);
    controller.forward(); // animasyonu büyütür ama geri kücülmesini saglamaz
    // controller.reverse(from: 1.0); burda tam tersi küçültür

    /**
    //animasyonun sonsuza kadar büyülüp küçülmesini sağlar
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
        */

    controller.addListener(() {
      setState(() {});
      print(animation.value);
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
      backgroundColor: Color(0xFFD71219),
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
                    child: Image.asset(
                      'images/resto2.png',
                      color: Colors.white,
                    ),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      ' Restaurant \n System',
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                        fontFamily: 'Bobbers',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Sign In',
              colour: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, SignupScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
