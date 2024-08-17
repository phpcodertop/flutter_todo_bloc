import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_todo/pages/home/home.dart';

import '../pages/profile/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFf9e889),
      child: Column(
        children: [
          Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  SvgPicture.asset(
                    'assets/images/hero.svg',
                    width: 150,
                    height: 150,
                  ),
                  const Divider(
                    endIndent: 20,
                    indent: 20,
                  ),
                  ListTile(
                    title: const Text('Home'),
                    leading: const Icon(Icons.home_filled),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const Home(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('My Profile'),
                    leading: const Icon(Icons.person),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                ],
              )),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
