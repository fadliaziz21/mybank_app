import 'package:flutter/material.dart';
import 'package:mybank_app/constans/main_data.dart';
import 'package:mybank_app/features/profile/models/profile_models.dart';

Map<String, dynamic> accountInfoList = AppData.accountInformation[0];

List profileSettingList = [
  ProfileSettingItem(Icons.person_sharp, 'My Profile'),
  ProfileSettingItem(Icons.verified_user, 'Account Security'),
  ProfileSettingItem(Icons.payment, 'Limit & Payment Settings'),
  ProfileSettingItem(Icons.settings, 'General Settings'),
  ProfileSettingItem(Icons.card_giftcard, 'Refer a Friend'),
];
