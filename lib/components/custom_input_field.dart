import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String value;
  bool isLast;
  bool isPassword;

  CustomInputField({
    super.key,
    required this.title,
    required this.controller,
    this.value = '',
    this.isLast = false,
    this.isPassword = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  void initState() {
    super.initState();
    widget.controller.value = TextEditingValue(
      text: widget.value,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26),
      ),
      child: TextField(
        obscureText: widget.isPassword ?? true,
        controller: widget.controller,
        textInputAction: widget.isLast ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          labelText: widget.title,
        ),
      ),
    );
  }
}
