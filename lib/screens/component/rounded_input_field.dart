import 'package:flutter/material.dart';
import 'package:login/screens/component/text_field_container.dart';
import 'package:login/theme/style.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
    required this.size,
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final Size size;
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      size: size,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            fillColor: kPrimaryLightColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryLightColor),
                borderRadius: BorderRadius.circular(30.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryLightColor),
                borderRadius: BorderRadius.circular(30.0)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryLightColor),
                borderRadius: BorderRadius.circular(30.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryLightColor),
                borderRadius: BorderRadius.circular(30.0)),
            contentPadding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            prefixIcon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
