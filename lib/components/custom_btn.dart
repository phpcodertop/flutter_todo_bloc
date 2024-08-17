import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final int decreasedSize;

  const CustomBtn({super.key, required this.text, this.onTap, this.decreasedSize = 0});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF00ddb0),
              Color(0xFF1cc0b7),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        width: width - decreasedSize,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'LilitaOne',
            ),
          ),
        ),
      ),
    );
  }
}
