import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';

class HelpCenterList extends StatelessWidget {
  final String topicTitle;
  final List topicList;
  const HelpCenterList(
      {super.key, required this.topicTitle, required this.topicList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: Styles.eiTop20,
          child: Text(
            topicTitle,
            textAlign: TextAlign.left,
            style: FontStyles.textDark16bold,
          ),
        ),
        Styles.lineBreak15,
        ListView.builder(
          shrinkWrap: true,
          itemCount: topicList.length,
          itemBuilder: (context, index) {
            return HelpCenterDetailList(
              index: index,
              topicListLength: topicList.length,
              topicName: topicList[index]['topicName'],
            );
          },
        ),
      ],
    );
  }
}

class HelpCenterDetailList extends StatelessWidget {
  final int index;
  final int topicListLength;
  final String topicName;
  const HelpCenterDetailList(
      {super.key,
      required this.index,
      required this.topicListLength,
      required this.topicName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Styles.eiHorizontal10Vertical5,
      decoration: index == 0
          ? Styles.decorationTop15BorderLightGreyW1
          : index == topicListLength - 1
              ? Styles.decorationBottom15BorderLightGreyW1
              : Styles.decorationBorderLightGreyW1,
      child: Row(
        children: [
          Flexible(
            child: Text(
              topicName,
              textAlign: TextAlign.left,
              style: FontStyles.textDark14,
            ),
          ),
          // Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            iconSize: 20.0,
            color: AppColors.lightGreyColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
