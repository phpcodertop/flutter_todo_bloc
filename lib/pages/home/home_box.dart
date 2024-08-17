import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBox extends StatelessWidget {
  final String title;
  final String icon;
  final int tasksCount;
  final GestureTapCallback? onTap;

  const HomeBox({
    super.key,
    required this.title,
    required this.icon,
    required this.tasksCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: title.toLowerCase(),
              child: SvgPicture.asset(
                icon,
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'ConcertOne',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$tasksCount tasks',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
