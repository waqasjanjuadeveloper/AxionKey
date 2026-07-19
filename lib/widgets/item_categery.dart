import 'package:axionkey/screens/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ItemCategery extends StatelessWidget {
  final IconData icon;
  final String name;
  const ItemCategery({super.key,required this.icon,required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 2, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 30,
            foregroundColor: AppColors.whiteColor,
            child: Icon(
              icon,
              color: AppColors.whiteColor,
            ),

          ),
          Text(name,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppColors.blackColor),),

        ],
      ),
    );
  }
}
