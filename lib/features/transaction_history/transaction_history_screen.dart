import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Color(0xff1a73e8);
  final _tabs = [
    Tab(text: 'Tab1'),
    Tab(text: 'Tab2'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
        body: Center(
          child: SafeArea(
            // child: Text("Transaction History"),
            child: Column(
              children: [
                Container(
                  height: kToolbarHeight - 15.0,
                  margin: Styles.eiTop50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: _selectedColor),
                    labelColor: AppColors.whiteColor,
                    unselectedLabelColor: AppColors.darkColor,
                    tabs: _tabs,
                  ),
                ),
                Expanded(
                  child: TabBarView(
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
        ),
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
}
