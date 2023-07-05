import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';

class DashboardMenu extends StatelessWidget {
  final String urlImage;
  final String menuName;

  const DashboardMenu(
      {super.key, required this.urlImage, required this.menuName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            children: [
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage(
                        urlImage,
                      ),
                      height: 50,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    menuName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardSavingsMenuCard extends StatelessWidget {
  final String urlImage;
  const DashboardSavingsMenuCard({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.eiAll7,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            Styles.smallBoxShadow,
          ],
        ),
        child: Image(
          image: AssetImage(urlImage),
          height: 100.0,
        ),
      ),
    );
  }
}

class DashboardSavingsMenuInfo extends StatelessWidget {
  final String cardName;
  final String balance;
  final String accountNumber;
  const DashboardSavingsMenuInfo(
      {super.key,
      required this.cardName,
      required this.balance,
      required this.accountNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.eiAll7,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Balance',
              textAlign: TextAlign.left,
              style: FontStyles.textDark14w500,
            ),
            savingsMenuBalanceInfo(),
            savingsMenuCardInfo(),
          ],
        ),
      ),
    );
  }

  savingsMenuBalanceInfo() {
    return Container(
      margin: Styles.eiTop3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            balance,
            textAlign: TextAlign.left,
            style: FontStyles.textDark20bold,
          ),
          Container(
            margin: Styles.eiLeft5,
            child: const Text(
              'IDR',
              textAlign: TextAlign.left,
              style: FontStyles.textDark12,
            ),
          ),
        ],
      ),
    );
  }

  savingsMenuCardInfo() {
    return Container(
      child: Row(
        children: [
          Container(
            child: Text(
              cardName + ' - ',
              textAlign: TextAlign.left,
              style: FontStyles.textDark14,
            ),
          ),
          Text(
            accountNumber,
            textAlign: TextAlign.left,
            style: FontStyles.textDark14w500,
          ),
        ],
      ),
    );
  }
}
