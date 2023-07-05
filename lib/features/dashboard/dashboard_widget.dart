import 'package:flutter/material.dart';
import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/colors.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      shadowColor: Colors.black,
      toolbarHeight: 80,
      title: Container(
        width: 40,
        child: Image.asset(Assets.myBankIcon),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
