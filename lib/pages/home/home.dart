import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/components/my_drawer.dart';
import 'package:flutter_todo/pages/category/category_page.dart';
import 'package:flutter_todo/pages/home/home_box.dart';
import 'package:flutter_todo/pages/profile/profile_page.dart';
import '../../components/rounded_bg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          // background
          RoundedBg(height: height),

          // content
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
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Hammody',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'ConcertOne',
                            ),
                          ),
                          Text(
                            'Today you have 4 tasks',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/images/hero.svg',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  HomeBox(
                    title: 'Today',
                    icon: 'assets/images/sun-svgrepo-com.svg',
                    tasksCount: 4,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                            categoryName: 'today',
                            icon: 'assets/images/sun-svgrepo-com.svg',
                          ),
                        ),
                      );
                    },
                  ),
                  HomeBox(
                    title: 'Planned',
                    icon: 'assets/images/calender2.svg',
                    tasksCount: 4,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                            categoryName: 'planned',
                            icon: 'assets/images/calender2.svg',
                          ),
                        ),
                      );
                    },
                  ),
                  HomeBox(
                    title: 'Personal',
                    icon: 'assets/images/person-with-laptop-male.svg',
                    tasksCount: 4,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                            categoryName: 'personal',
                            icon: 'assets/images/person-with-laptop-male.svg',
                          ),
                        ),
                      );
                    },
                  ),
                  HomeBox(
                    title: 'Work',
                    icon: 'assets/images/bag.svg',
                    tasksCount: 4,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                            categoryName: 'work',
                            icon: 'assets/images/bag.svg',
                          ),
                        ),
                      );
                    },
                  ),
                  HomeBox(
                    title: 'Shopping',
                    icon: 'assets/images/shopping.svg',
                    tasksCount: 4,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CategoryPage(
                            categoryName: 'shopping',
                            icon: 'assets/images/shopping.svg',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
