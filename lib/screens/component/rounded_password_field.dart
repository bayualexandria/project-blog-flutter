import 'package:flutter/material.dart';
import 'package:login/screens/component/text_field_container.dart';
import 'package:login/theme/style.dart' as style;

class RoundedPasswordField extends StatefulWidget {
  const RoundedPasswordField({
    Key? key,
    required this.size,
    required this.hintText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final Size size;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _password = false;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        size: widget.size,
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
              fillColor: style.kPrimaryLightColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: style.kPrimaryLightColor),
                  borderRadius: BorderRadius.circular(30.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: style.kPrimaryLightColor),
                  borderRadius: BorderRadius.circular(30.0)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: style.kPrimaryLightColor),
                  borderRadius: BorderRadius.circular(30.0)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: style.kPrimaryLightColor),
                  borderRadius: BorderRadius.circular(30.0)),
              contentPadding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              prefixIcon: const Icon(
                Icons.lock,
                color: style.kPrimaryColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => _password = !_password);
                  },
                  icon: Icon(
                    _password ? Icons.visibility_off : Icons.visibility,
                    color: style.kPrimaryColor,
                  )),
              hintText: widget.hintText,
              border: InputBorder.none),
          obscureText: !_password,
        ));
  }
}
