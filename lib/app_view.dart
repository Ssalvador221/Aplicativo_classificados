import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_bloc_application/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:flutter_bloc_application/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:flutter_bloc_application/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_application/screens/home/home_screen.dart';
import 'package:flutter_bloc_application/screens/authentication/welcome_screen.dart';
import 'package:post_repository/post_repository.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fyndsy',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            surface: Colors.white,
            onSurface: Colors.black,
            primary: Color.fromRGBO(5, 150, 105, 1),
            onPrimary: Colors.black,
            secondary: Color.fromRGBO(5, 150, 105, 1),
            onSecondary: Colors.white,
            tertiary: Color.fromRGBO(255, 204, 128, 1),
            error: Colors.red,
            outline: Color.fromRGBO(185, 185, 185, 100)),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignInBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository),
              ),
              BlocProvider(
                create: (context) => MyUserBloc(
                    myUserRepository:
                        context.read<AuthenticationBloc>().userRepository)
                  ..add(GetMyUser(
                      myUserId:
                          context.read<AuthenticationBloc>().state.user!.uid)),
              ),
              BlocProvider(
                  create: (context) =>
                      GetPostBloc(postRepository: FirebasePostRepository())
                        ..add(GetPosts()))
            ],
            child: const HomeScreen(),
          );
        } else {
          return const WelcomeScreen();
        }
      }),
    );
  }
}
