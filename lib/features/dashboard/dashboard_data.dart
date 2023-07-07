import 'package:mybank_app/constans/assets.dart';

List dashboardFooterList = [
  _DashboardFooterItem(
    Assets.dashboardFooterImg[1],
    'Home',
  ),
  _DashboardFooterItem(
    Assets.dashboardFooterImg[2],
    'History',
  ),
  _DashboardFooterItem(
    Assets.dashboardFooterImg[3],
    'Help Center',
  ),
  _DashboardFooterItem(
    Assets.dashboardFooterImg[4],
    'Profile',
  ),
];

class _DashboardFooterItem {
  final String urlImage;
  final String labelName;

  _DashboardFooterItem(this.urlImage, this.labelName);
}
