import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/dashboard/data/dashboard_data.dart';
import 'package:mybank_app/features/dashboard_home/dashboard_home_screen.dart';
import 'package:mybank_app/features/profile/profile_screen.dart';

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
      backgroundColor: AppColors.whiteSmokeColor,
      body: SafeArea(
        child: _buildBody(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    switch (selectedIndex) {
      case 0:
        return const DashboardHomePage();
      default:
        return const ProfilePage();
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
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey.shade600,
        ),
      ),
    );
  }
}
