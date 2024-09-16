import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/bloc/todo/todo_bloc.dart';
import 'package:flutter_todo/bloc/todo/todo_event.dart';
import 'package:flutter_todo/bloc/todo/todo_state.dart';
import 'package:flutter_todo/bloc/user/user_bloc.dart';
import 'package:flutter_todo/components/my_drawer.dart';
import 'package:flutter_todo/pages/category/category_page.dart';
import 'package:flutter_todo/pages/home/home_box.dart';
import '../../components/rounded_bg.dart';
import '../../models/todo_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    String username = '';

    if (context.read<UserBloc>().state is UserLoadedState) {
      username = context.read<UserBloc>().currentUser.username.toString();
    }

    return BlocProvider(
      create: (context) => TodoBloc()..add(TodoLoadingEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        drawer: const MyDrawer(),
        body: Stack(
          children: [
            // background
            RoundedBg(height: height),

            // content
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if(state is TodoLoadingState) {
                  return const Center(child: CircularProgressIndicator(),);
                } else if (state is TodoLoadedState) {
                  var todos = context.read<TodoBloc>().todos;
                  int todayTodos = todos.where((TodoItem todoItem) {
                    return todoItem.category == 'today';
                  }).length;
                  int plannedTodos = todos.where((TodoItem todoItem) {
                    return todoItem.category == 'planned';
                  }).length;
                  int personalTodos = todos.where((TodoItem todoItem) {
                    return todoItem.category == 'personal';
                  }).length;
                  int workTodos = todos.where((TodoItem todoItem) {
                    return todoItem.category == 'work';
                  }).length;
                  int shoppingTodos = todos.where((TodoItem todoItem) {
                    return todoItem.category == 'shopping';
                  }).length;
                  return SingleChildScrollView(
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello $username',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'ConcertOne',
                                    ),
                                  ),
                                  Text(
                                    'Today you have $todayTodos tasks',
                                    style: const TextStyle(
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
                            tasksCount: todayTodos,
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
                            tasksCount: plannedTodos,
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
                            tasksCount: personalTodos,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CategoryPage(
                                    categoryName: 'personal',
                                    icon:
                                    'assets/images/person-with-laptop-male.svg',
                                  ),
                                ),
                              );
                            },
                          ),
                          HomeBox(
                            title: 'Work',
                            icon: 'assets/images/bag.svg',
                            tasksCount: workTodos,
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
                            tasksCount: shoppingTodos,
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
                  );
                }

                return const Center(child: CircularProgressIndicator(),);
              },
            )
          ],
        ),
      ),
    );
  }
}
