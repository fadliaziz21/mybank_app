import 'package:flutter/material.dart';
import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/dashboard/dashboard_data.dart';
import 'package:mybank_app/features/dashboard_home/dashboard_home_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/transaction-history');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/help-center');
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: _buildAppBar(),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
    switch (selectedIndex) {
      case 0:
        return const DashboardHomePage();
      // case 1:
      //   return const Center(child: Text('Search'));
      // case 2:
      //   return const Center(child: Text('Account'));
      default:
        return const Center(child: Text('Default'));
    }
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: Styles.borderRadTop25,
        boxShadow: [
          Styles.boxShadowSmall,
        ],
      ),
      child: ClipRRect(
        borderRadius: Styles.borderRadTop25,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(dashboardFooterList[0].urlImage),
                size: 35,
              ),
              label: dashboardFooterList[0].labelName,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(dashboardFooterList[1].urlImage),
                size: 35,
              ),
              label: dashboardFooterList[1].labelName,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(dashboardFooterList[2].urlImage),
                size: 35,
              ),
              label: dashboardFooterList[2].labelName,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(dashboardFooterList[3].urlImage),
                size: 35,
              ),
              label: dashboardFooterList[3].labelName,
            ),
          ],
          unselectedItemColor: Colors.grey.shade600,
          selectedItemColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
