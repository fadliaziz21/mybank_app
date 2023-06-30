import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/main_data.dart';

List dashboardMenuList = [
  _DashboardMenuItem(
    Assets.dashboardMenuImg[1],
    'Scan QR',
  ),
  _DashboardMenuItem(
    Assets.dashboardMenuImg[2],
    'Transfer',
  ),
  _DashboardMenuItem(
    Assets.dashboardMenuImg[3],
    'E-Money',
  ),
  _DashboardMenuItem(
    Assets.dashboardMenuImg[4],
    'My Bills',
  ),
  _DashboardMenuItem(
    Assets.dashboardMenuImg[5],
    'Shopping',
  ),
  _DashboardMenuItem(
    Assets.dashboardMenuImg[6],
    'Pulsa & Internet',
  ),
  _DashboardMenuItem(
    Assets.dashboardMenuImg[7],
    'Zakat',
  ),
  _DashboardMenuItem(
    Assets.dashboardMenuImg[8],
    'Asuransi',
  ),
];

List dashboardSavingsMenuList = [
  _DashboardSavingsMenuItem({
    'cardType': {
      'cardImg': AppData.cardType[1]['cardImage'],
    },
    'balance': '9.876.543,18',
    'accountNumber': '1234567890',
  }),
];

class _DashboardMenuItem {
  final String urlImage;
  final String menuName;

  _DashboardMenuItem(this.urlImage, this.menuName);
}

class _DashboardSavingsMenuItem {
  final Map<String, dynamic> savingsCard;

  _DashboardSavingsMenuItem(this.savingsCard);
}
