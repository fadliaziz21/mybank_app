import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/dashboard_home/dashboard_home_data.dart';
import 'package:mybank_app/features/dashboard_home/dashboard_home_widget.dart';

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage({super.key});

  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            dashboardHomeMenu(),
            dashboardSavingsMenu(),
            dashboardRecentTransactionTitle()
          ],
        ),
      ),
    );
  }

  dashboardHomeMenu() {
    return Container(
      height: 250.0,
      padding: Styles.eiAll10Top20,
      margin: Styles.eiBottom10,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: Styles.bottomBorderRadius25,
        boxShadow: [
          Styles.mediumBoxShadow,
        ],
      ),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return DashboardMenu(
            urlImage: dashboardMenuList[index].urlImage,
            menuName: dashboardMenuList[index].menuName,
          );
        },
        itemCount: dashboardMenuList.length,
      ),
    );
  }

  dashboardSavingsMenu() {
    return Padding(
      padding: Styles.eiHorizontal20Vertical10,
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: Styles.allBorderRadiusCircular10,
          boxShadow: const [
            Styles.smallBoxShadow,
          ],
        ),
        child: Row(
          children: [
            DashboardSavingsMenuCard(
              urlImage: dashboardSavingsMenuList['cardType']['cardImage'],
            ),
            DashboardSavingsMenuInfo(
                cardName: dashboardSavingsMenuList['cardType']['cardName'],
                balance: dashboardSavingsMenuList['balance'],
                accountNumber: dashboardSavingsMenuList['accountNumber']),
          ],
        ),
      ),
    );
  }

  dashboardRecentTransactionTitle() {
    return Container(
      child: Padding(
        padding: Styles.eiHorizontal20Vertical10,
        child: Row(
          children: [
            Container(
              child: const Text(
                'Recent Transactions',
                textAlign: TextAlign.left,
                style: FontStyles.textBlack18bold,
              ),
            ),
            const Spacer(),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/transaction-history');
                },
                child: const Text(
                  'See All',
                  textAlign: TextAlign.right,
                  style: FontStyles.textBlack14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
