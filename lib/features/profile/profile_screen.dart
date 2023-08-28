import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/profile/data/profile_data.dart';
import 'package:mybank_app/features/profile/widget/profile_widget.dart';

import '../../constans/font_styles.dart';

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
            profilePictContainer(),
            accountInfoContainer(),
            profileListContainer(),
          ],
        ),
      ),
    );
  }

  profilePictContainer() {
    return Center(
        child: Column(
      children: [
        ProfilePicture(
          urlImage: accountInfoList['profilePicture'],
          accountStatus: accountInfoList['accountStatus'],
        ),
        if (accountInfoList['accountStatus'] == 'Basic')
          upgradeAccountContainer()
      ],
    ));
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
      margin: Styles.eiTop20,
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

  profileListContainer() {
    return Padding(
      padding: Styles.eiAll10,
      child: Container(
        margin: Styles.eiTop10,
        padding: Styles.eiAll5,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: Styles.borderRadCircular15,
          border: Border.all(
            color: AppColors.lightGreyColor,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: Styles.eiAll5,
              child: Icon(
                Icons.verified,
                color: AppColors.primaryColor,
                size: 30.0,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: Styles.eiAll7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'transactionName',
                        textAlign: TextAlign.left,
                        style: FontStyles.textDark14w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              iconSize: 20.0,
              color: AppColors.lightGreyColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
