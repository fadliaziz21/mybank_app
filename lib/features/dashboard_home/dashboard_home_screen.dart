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
      padding: Styles.eiAll10Top20,
      margin: Styles.eiBottom10,
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
