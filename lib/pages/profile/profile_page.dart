import 'package:flutter/material.dart';
import 'package:flutter_todo/components/custom_input_field.dart';
import 'package:flutter_todo/components/rounded_bg.dart';

import '../../components/custom_btn.dart';
import '../../components/my_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: const MyDrawer(),
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
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 40,
                    ),
                  ),
            
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'My Profile',
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
                        value: 'Ahmed Halima',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputField(
                        title: 'Email',
                        controller: emailController,
                        value: 'phpcodertop@gmail.com',
                        isLast: true,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomBtn(text: 'Save', onTap: () {},),
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
