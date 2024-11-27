import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_bloc_application/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_application/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter_bloc_application/screens/authentication/sign_in_screen.dart';
import 'package:flutter_bloc_application/screens/authentication/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  Widget? wid;
  bool isRegisterScreen = false;

  @override
  Widget build(BuildContext context) {
    wid ??= BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(
            userRepository: context.read<AuthenticationBloc>().userRepository),
        child: const SignInScreen());

    void switchWidget() {
      if (isRegisterScreen) {
        wid = BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
          child: const SignInScreen(),
        );
      } else {
        setState(() {
          wid = BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(
                userRepository:
                    context.read<AuthenticationBloc>().userRepository),
            child: const SignUpScreen(),
          );
        });
      }

      isRegisterScreen = !isRegisterScreen;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 100.0),
                          child: Text(
                            'Fyndsy',
                            style: TextStyle(
                                fontSize: 28,
                                color: Theme.of(context).colorScheme.primary),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: AnimatedSwitcher(
                            duration: const Duration(microseconds: 200),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            child: wid,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(isRegisterScreen
                                  ? "Já tem cadastro?"
                                  : "Não tem conta?"),
                              SizedBox(
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        switchWidget();
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Text(
                                        isRegisterScreen
                                            ? "Login"
                                            : "Cadastre-se",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
