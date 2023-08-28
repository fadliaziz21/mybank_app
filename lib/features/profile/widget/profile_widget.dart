import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';

import '../../../constans/font_styles.dart';

class ProfilePicture extends StatelessWidget {
  final String urlImage;
  final String accountStatus;

  const ProfilePicture(
      {super.key, required this.urlImage, required this.accountStatus});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: accountStatus == 'Premium'
            ? ProfilePicturePremium(urlImage: urlImage)
            : ProfilePictureBasic(urlImage: urlImage));
  }
}

class ProfilePictureBasic extends StatelessWidget {
  final String urlImage;
  const ProfilePictureBasic({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 130.0,
      margin: Styles.eiTop25,
      decoration: Styles.decorationCirclePrimary,
      child: CircleAvatar(
        backgroundImage: AssetImage(urlImage),
      ),
    );
  }
}

class ProfilePicturePremium extends StatelessWidget {
  final String urlImage;
  const ProfilePicturePremium({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 140.0,
          height: 140.0,
          margin: Styles.eiTop25,
          decoration: Styles.decorationCirclePrimary,
          padding: Styles.eiAll5,
          child: ClipOval(
            child: Container(
              width: 250.0,
              height: 250.0,
              child: Image.asset(
                urlImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 135.0,
          left: 120.0,
          right: 0.0,
          child: Center(
            child: Icon(
              Icons.verified,
              color: AppColors.primaryColor,
              size: 30.0,
            ),
          ),
        )
      ],
    );
  }
}

class ProfileList extends StatelessWidget {
  final IconData iconName;
  final String settingName;
  final int index;
  final int profileListLength;

  const ProfileList(
    this.index,
    this.profileListLength, {
    super.key,
    required this.iconName,
    required this.settingName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Styles.eiAll5,
      decoration: index == 0 && index == profileListLength - 1
          ? Styles.decorationAll15BorderLightGreyW1
          : index == 0
              ? Styles.decorationTop15BorderLightGreyW1
              : index == profileListLength - 1
                  ? Styles.decorationBottom15BorderLightGreyW1
                  : Styles.decorationBorderLightGreyW1,
      child: Row(
        children: [
          Padding(
            padding: Styles.eiAll5,
            child: Icon(
              iconName,
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
                      settingName,
                      textAlign: TextAlign.left,
                      style: FontStyles.textDark14w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            iconSize: 20.0,
            color: AppColors.lightGreyColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
