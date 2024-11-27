import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_application/components/text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = false;
  bool signInRequired = false;
  IconData iconPassword = Icons.visibility_off_outlined;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            setState(() {
              signInRequired = false;
            });
          } else if (state is SignInLoading) {
            setState(() {
              signInRequired = true;
            });
          } else if (state is SignInFailure) {
            signInRequired = false;
            log("Error ao fazer login"); /* Adicionar PopUp de error */
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 55,
                    child: InputTextFieldComponent(
                      controller: passwordController,
                      hintText: "Email",
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a text";
                        }
                        return null;
                      },
                    )),
              ),
              const SizedBox(height: 30),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 55,
                  child: InputTextFieldComponent(
                      controller: emailController,
                      hintText: "Senha",
                      obscureText: obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (String text) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter a text";
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                              if (obscurePassword) {
                                iconPassword = Icons.visibility_off_outlined;
                              } else {
                                iconPassword = Icons.visibility_outlined;
                              }
                            });
                          },
                          icon: Icon(iconPassword))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              !signInRequired
                  ? ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            tryLogin();
                          },
                          style: TextButton.styleFrom(
                              elevation: 3.0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.surface,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Text(
                              "Entrar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const CircularProgressIndicator(),
              const SizedBox(
                height: 35,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "ou",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                  ),
                  Expanded(
                    child:
                        Divider(color: Theme.of(context).colorScheme.outline),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.g_mobiledata,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                    label: const Text(
                      "Entrar com Google",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      elevation: 3,
                      overlayColor: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void tryLogin() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Processing Data')));
    }
  }
}
