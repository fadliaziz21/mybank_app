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
        ],
      )),
    );
  }

  dashboardHomeMenu() {
    return Container(
      height: 250.0,
      padding:
          EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: Styles.bottomBorderRadius,
        boxShadow: [
          Styles.mediumBoxShadow,
        ],
      ),
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
            return DashboardMenu(
              urlImage: dashboardMenuList[index].urlImage,
              menuName: dashboardMenuList[index].menuName,
            );
          }),
    );
  }
}
