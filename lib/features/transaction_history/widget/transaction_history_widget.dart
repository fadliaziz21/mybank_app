import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';

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
            width: 1.0,
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

class TransactionList extends StatelessWidget {
  final String urlImage;
  final String transactionType;
  final String transactionName;
  final String transactionDate;
  final String transactionAmount;
  const TransactionList({
    super.key,
    required this.urlImage,
    required this.transactionType,
    required this.transactionName,
    required this.transactionDate,
    required this.transactionAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.eiHorizontal20Vertical10,
      child: Container(
        height: 85.0,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: Styles.borderRadCircular10,
          boxShadow: const [
            Styles.boxShadowSmall,
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: Styles.eiAll7,
              child: Image(
                image: AssetImage(
                  urlImage,
                ),
                height: 75.0,
              ),
            ),
            Padding(
              padding: Styles.eiAll7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    transactionName,
                    textAlign: TextAlign.left,
                    style: FontStyles.textDark12w500,
                  ),
                  transactionType == 'income'
                      ? Text(
                          '+ $transactionAmount IDR',
                          textAlign: TextAlign.left,
                          style: FontStyles.textPrimary18bold,
                        )
                      : Text(
                          '- $transactionAmount IDR',
                          textAlign: TextAlign.left,
                          style: FontStyles.textDanger18bold,
                        ),
                  Text(
                    transactionDate,
                    textAlign: TextAlign.left,
                    style: FontStyles.textDark12,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
