import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
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
          child: _buildAppBar(),
          preferredSize: const Size.fromHeight(80.0),
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
      leading: BackButton(color: AppColors.whiteColor),
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
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                labelColor: AppColors.whiteColor,
                unselectedLabelColor: AppColors.primaryColor,
                dividerColor: Colors.transparent,
                tabs: [
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
                  Text(
                    'Tab 1',
                  ),
                  Text('Tab 2'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
