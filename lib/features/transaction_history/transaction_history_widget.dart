import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';

class TransactionHistoryTabBar extends StatelessWidget {
  final String labelName;
  const TransactionHistoryTabBar({super.key, required this.labelName});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(labelName),
        ),
      ),
    );
  }
}
