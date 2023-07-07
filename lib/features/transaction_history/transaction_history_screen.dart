import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/transaction_history/transaction_history_data.dart';
import 'package:mybank_app/features/transaction_history/transaction_history_widget.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: _buildAppBar(),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      shadowColor: AppColors.secondaryColor,
      toolbarHeight: 80.0,
      leading: const BackButton(color: AppColors.whiteColor),
      title: const Text(
        'Transaction History',
        style: FontStyles.textWhite,
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 35.0,
              margin: Styles.eiTop25,
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: AppColors.primaryColor,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                labelColor: AppColors.whiteColor,
                unselectedLabelColor: AppColors.primaryColor,
                dividerColor: Colors.transparent,
                tabs: const [
                  TransactionHistoryTabBar(
                    labelName: 'Income',
                  ),
                  TransactionHistoryTabBar(
                    labelName: 'Outcome',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    padding: Styles.eiHorizontal20Vertical10,
                    margin: Styles.eiAll10,
                    child: transactionTabList('income', 0),
                  ),
                  Container(
                    padding: Styles.eiHorizontal20Vertical10,
                    margin: Styles.eiAll10,
                    child: transactionTabList('outcome', 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  transactionTabList(transactionType, limit) {
    int transactionListLength;
    List<Map<String, dynamic>> transactionList = transactionHistoryList;
    if (transactionType == 'allLimit') {
      transactionListLength = limit;
    } else {
      transactionList = transactionHistoryList
          .where((map) => map['transactionType'].contains(transactionType))
          .toList();
      transactionListLength = transactionList.length;
    }

    return ListView.builder(
        shrinkWrap: true,
        itemCount: transactionListLength,
        itemBuilder: (context, index) {
          return TransactionList(
            urlImage: transactionList[index]['urlImage'],
            transactionType: transactionList[index]['transactionType'],
            transactionName: transactionList[index]['transactionName'],
            transactionDate: transactionList[index]['transactionDate'],
            transactionAmount: transactionList[index]['transactionAmount'],
          );
        });
  }
}
