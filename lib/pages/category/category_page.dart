import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../components/dismissible_item.dart';
import '../../components/rounded_bg.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final String icon;

  const CategoryPage({super.key, required this.categoryName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background
          const RoundedBg(height: 500),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Row(
                    children: [
                      Hero(
                        tag: categoryName,
                        child: SvgPicture.asset(
                          icon,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '5 tasks',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            toBeginningOfSentenceCase(categoryName),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              fontFamily: 'ConcertOne',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DismissibleItem(
                    text: 'Meet Friends',
                    isChecked: true,
                    onDismiss: (dismissDirection) async {
                      return false;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
