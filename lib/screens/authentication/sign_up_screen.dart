import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_application/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter_bloc_application/components/text_form_field.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = false;
  bool signUpRequired = false;
  IconData iconPassword = Icons.visibility_off_outlined;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            setState(() {
              signUpRequired = false;
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sucesso ao se registrar!')));
            });
          } else if (state is SignUpProcess) {
            setState(() {
              signUpRequired = true;
            });
          } else if (state is SignInFailure) {
            signUpRequired = false;
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error ao registrar usuário')));
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
                      controller: usernameController,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 20,
                      ),
                      hintText: "Nome Completo",
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor informe um nome valido!";
                        }

                        if (value.length < 3) {
                          return "Nome completo deve conter 3 caracteres";
                        }

                        return null;
                      },
                    )),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 55,
                    child: InputTextFieldComponent(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor informe um email valido!";
                        }
                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                        size: 20,
                      ),
                    )),
              ),
              const SizedBox(height: 30),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 55,
                  child: InputTextFieldComponent(
                      controller: passwordController,
                      hintText: "Senha",
                      obscureText: obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (String text) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor preencha este campo!";
                        }

                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                        size: 20,
                      ),
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
                height: 30,
              ),
              !signUpRequired
                  ? Column(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () async {
                                signUp();
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
                                  "Registre-se",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "ou",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                  color: Theme.of(context).colorScheme.outline),
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
                                overlayColor:
                                    Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      MyUser myUser = MyUser.empty;
      myUser = myUser.copyWith(
          email: emailController.text, name: usernameController.text);

      setState(() {
        context
            .read<SignUpBloc>()
            .add(SignUpRequired(myUser, passwordController.text));
      });
    }
  }
}
