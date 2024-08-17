import 'package:flutter/material.dart';

class RoundedBg extends StatelessWidget {
  final double height;
  const RoundedBg({super.key, required this.height});


  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomRoundedClipper(),
      child: Container(
        height: height / 2,
        color: const Color(0xFFf9e889),
      ),
    );
  }
}

class BottomRoundedClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
