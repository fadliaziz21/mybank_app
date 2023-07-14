import 'package:flutter/material.dart';
import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/dashboard_home/dashboard_home_data.dart';
import 'package:mybank_app/features/dashboard_home/dashboard_home_widget.dart';
import 'package:mybank_app/features/transaction_history/transaction_history_data.dart';
import 'package:mybank_app/features/transaction_history/transaction_history_widget.dart';

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage({super.key});

  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteSmokeColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: _buildAppBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primaryColor,
      shadowColor: AppColors.secondaryColor,
      toolbarHeight: 80.0,
      title: Container(
        width: 40.0,
        child: Image.asset(Assets.myBankIcon),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: AppColors.whiteColor,
            size: 30.0,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          homeContainer(),
          savingsContainer(),
          recentTransactionTitleContainer(),
          recentTransactionListContainer()
        ],
      ),
    );
  }

  homeContainer() {
    return Container(
      height: 250.0,
      padding: Styles.eiAll10Top20,
      margin: Styles.eiBottom10,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: Styles.borderRadBottom25,
        boxShadow: [
          Styles.boxShadowMedium,
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

  savingsContainer() {
    return Padding(
      padding: Styles.eiHorizontal20Vertical10,
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: Styles.borderRadCircular10,
          boxShadow: const [
            Styles.boxShadowSmall,
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

  recentTransactionTitleContainer() {
    return Padding(
      padding: Styles.eiHorizontal20Vertical10,
      child: Row(
        children: [
          const Text(
            'Recent Transactions',
            textAlign: TextAlign.left,
            style: FontStyles.textDark18bold,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/transaction-history');
            },
            child: const Text(
              'See All',
              textAlign: TextAlign.right,
              style: FontStyles.textDark14,
            ),
          ),
        ],
      ),
    );
  }

  recentTransactionListContainer() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return TransactionList(
            urlImage: transactionHistoryList[index]['urlImage'],
            transactionType: transactionHistoryList[index]['transactionType'],
            transactionName: transactionHistoryList[index]['transactionName'],
            transactionDate: transactionHistoryList[index]['transactionDate'],
            transactionAmount: transactionHistoryList[index]
                ['transactionAmount'],
          );
        });
  }
}
