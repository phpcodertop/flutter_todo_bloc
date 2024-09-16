import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/user/user_bloc.dart';
import 'package:flutter_todo/components/custom_input_field.dart';
import 'package:flutter_todo/components/rounded_bg.dart';
import 'package:flutter_todo/pages/auth/signup.dart';
import 'package:flutter_todo/pages/home/home.dart';

import '../../components/custom_btn.dart';
import '../../components/my_drawer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    'Login',
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
                        title: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputField(
                        title: 'Password',
                        controller: passwordController,
                        isLast: true,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomBtn(
                        text: 'Login',
                        onTap: () {
                          context.read<UserBloc>().add(
                                UserLoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
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
                                builder: (ctx) => const SignUpPage(),
                              ));
                            },
                            child: const Text(
                              'Sign Up instead',
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
