import 'package:flutter/material.dart';
import 'package:flutter_todo/components/custom_input_field.dart';
import 'package:flutter_todo/components/rounded_bg.dart';
import 'package:flutter_todo/pages/auth/login.dart';

import '../../components/custom_btn.dart';
import '../../components/my_drawer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          RoundedBg(height: height),

          // form
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const Text(
                    'Signup',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ConcertOne'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      child: Column(
                    children: [
                      CustomInputField(
                        title: 'Username',
                        controller: usernameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputField(
                        title: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputField(
                        title: 'Password',
                        controller: passwordController,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputField(
                        title: 'Password Confirmation',
                        controller: passwordConfirmationController,
                        isLast: true,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomBtn(
                        text: 'SignUp',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const LoginPage(),
                              ));
                            },
                            child: const Text(
                              'Login instead',
                              style: TextStyle(
                                // fontFamily: '',
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
