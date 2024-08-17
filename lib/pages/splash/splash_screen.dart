import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/components/custom_btn.dart';
import 'package:flutter_todo/pages/auth/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          SvgPicture.asset('assets/images/splash.svg'),
          const Text(
            'Get Your Life Organized',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'LilitaOne',
              color: Colors.black87,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                    fontFamily: 'Trajan',
                  ),
                  text:
                      'TODOIST is a simple and effective to-do list and task manager app which helps you manage your time.'),
            ),
          ),
          CustomBtn(
            text: 'Get Started',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const LoginPage(),
                ),
              );
            },
            decreasedSize: 50,
          ),
        ],
      ),
    );
  }
}
