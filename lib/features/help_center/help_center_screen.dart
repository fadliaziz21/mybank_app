import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/help_center/data/help_center_data.dart';
import 'package:mybank_app/features/help_center/widget/help_center_widget.dart';

import '../../constans/font_styles.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  final TextEditingController _helpCenterSearchController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteSmokeColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: _buildAppBar(),
      ),
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      shadowColor: AppColors.secondaryColor,
      toolbarHeight: 80.0,
      leading: const BackButton(color: AppColors.whiteColor),
      title: const Text(
        'Help Center',
        style: FontStyles.textWhite,
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: Styles.eiHorizontal20Vertical10,
        child: Column(
          children: [
            helpCenterSearchBarContainer(),
            helpCenterListContainer(),
          ],
        ),
      ),
    );
  }

  helpCenterSearchBarContainer() {
    return Container(
      height: 45.0,
      margin: Styles.eiTop10,
      child: TextField(
        controller: _helpCenterSearchController,
        decoration: InputDecoration(
          hintText: 'Which feature do you need help?',
          hintStyle: FontStyles.textLightGrey14,
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            iconSize: 20.0,
            color: AppColors.lightGreyColor,
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            iconSize: 20.0,
            color: AppColors.lightGreyColor,
            onPressed: () {
              return _helpCenterSearchController.clear();
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  helpCenterListContainer() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: helpCenterList.length,
        itemBuilder: (context, index) {
          return HelpCenterList(
            topicTitle: helpCenterList[index]['topicTitle'],
            topicList: helpCenterList[index]['topicList'],
          );
        });
  }
}
