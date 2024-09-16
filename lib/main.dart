import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/app_bloc_observer.dart';
import 'package:flutter_todo/bloc/user/user_bloc.dart';
import 'package:flutter_todo/pages/auth/login.dart';
import 'package:flutter_todo/pages/auth/signup.dart';
import 'package:flutter_todo/pages/home/home.dart';
import 'package:flutter_todo/pages/profile/profile_page.dart';
import '/pages/splash/splash_screen.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()..add(UserLoadingEvent()),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODOIST',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        home: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserInitial) {
              return const SplashScreen();
            } else if(state is UserLoadedState){
              return const Home();
            } else {
              return const SplashScreen();
            }
          },
        ),
        routes: {
          '/home': (context) => const Home(),
          '/splash': (context) => const SplashScreen(),
          '/profile': (context) => const ProfilePage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
        },
      ),
    );
  }
}