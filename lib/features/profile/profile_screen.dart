import 'package:flutter/material.dart';
import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/profile/profile_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteSmokeColor,
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: Styles.eiHorizontal20Vertical10,
        child: Column(
          children: [
            profilePictPremiumContainer(),
            accountInfoContainer(),
            upgradeAccountContainer(),
          ],
        ),
      ),
    );
  }

  profilePictPremiumContainer() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 135.0,
            height: 135.0,
            margin: Styles.eiTop25,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            padding: Styles.eiAll5,
            child: ClipOval(
              child: Container(
                width: 250.0,
                height: 250.0,
                child: Image.asset(
                  Assets.myBankProfile,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 105.0,
            left: 105.0,
            right: 0.0,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 30.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  profilePictContainer() {
    return Center(
      child: Container(
        width: 130.0,
        height: 130.0,
        margin: Styles.eiTop25,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(Assets.myBankProfile),
        ),
      ),
    );
  }

  accountInfoContainer() {
    return Container(
      margin: Styles.eiTop20,
      child: Column(
        children: [
          Text(
            accountInfoList['accountName'],
            style: FontStyles.textDark16bold,
          ),
          Text(
            accountInfoList['accountNumber'],
            style: FontStyles.textDark14,
          ),
        ],
      ),
    );
  }

  upgradeAccountContainer() {
    return Container(
      width: 200.0,
      height: 40.0,
      margin: Styles.eiTop10,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: Styles.borderRadCircular25,
            ),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Upgrade to Premium',
          style: FontStyles.textWhite,
        ),
      ),
    );
  }
}
