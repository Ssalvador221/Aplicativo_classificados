import 'package:flutter/material.dart';

class InputTextFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final String? Function(String?)? onChanged;

  const InputTextFieldComponent(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.keyboardType,
      this.textInputAction,
      this.onFieldSubmitted,
      this.onTap,
      this.suffixIcon,
      this.prefixIcon,
      this.validator,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          errorStyle: const TextStyle(
            fontSize: 13,
            height: 1,
            color: Colors.red,
          ),
          errorMaxLines: 1,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: Theme.of(context).colorScheme.error)),
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.surface),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: Theme.of(context).colorScheme.secondary))),
    );
  }
}
