import 'package:flutter/material.dart';

class HomeItemBanner extends StatelessWidget {
  final String image;
  const HomeItemBanner({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.indigo,
        image: DecorationImage(
           image: AssetImage('lib/assets/images/'),
        ),
      ),
    );
  }
}

