import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/main_data.dart';
import 'package:mybank_app/features/dashboard_home/models/dashboard_home_models.dart';

List dashboardMenuList = [
  DashboardMenuItem(
    Assets.dashboardMenuImg[1],
    'Scan QR',
  ),
  DashboardMenuItem(
    Assets.dashboardMenuImg[2],
    'Transfer',
  ),
  DashboardMenuItem(
    Assets.dashboardMenuImg[3],
    'E-Money',
  ),
  DashboardMenuItem(
    Assets.dashboardMenuImg[4],
    'My Bills',
  ),
  DashboardMenuItem(
    Assets.dashboardMenuImg[5],
    'Shopping',
  ),
  DashboardMenuItem(
    Assets.dashboardMenuImg[6],
    'Pulsa & Internet',
  ),
  DashboardMenuItem(
    Assets.dashboardMenuImg[7],
    'Zakat',
  ),
  DashboardMenuItem(
    Assets.dashboardMenuImg[8],
    'Asuransi',
  ),
];

Map<String, dynamic> dashboardSavingsMenuList = AppData.accountInformation[0];
