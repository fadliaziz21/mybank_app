import 'package:flutter/material.dart';
import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/features/dashboard/dashboard_data.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: _buildAppBar(),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      shadowColor: Colors.black,
      toolbarHeight: 80.0,
      title: Container(
        width: 40.0,
        child: Image.asset(Assets.myBankIcon),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
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
        return const Center(child: Text('Home'));
      case 1:
        return const Center(child: Text('Search'));
      case 2:
        return const Center(child: Text('Account'));
      default:
        return const Center(child: Text('Default'));
    }
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
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
