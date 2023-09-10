import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';

import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../models/notifications_model.dart';

class BuildNotificationItem extends StatelessWidget {
  final NotificationsModel model;
  const BuildNotificationItem({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: ColorManager.grey2.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Image.asset(
                  AssetsManager.logo,
                  width: 50,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: context.width *0.7
                ),
                child: MyText(
                  title: "${model.data?.body}",
                  color: ColorManager.black,
                  size: 13,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.timer_sharp,
                  color: ColorManager.grey2,
                ),
                MyText(
                  title: "${model.createdAt}",
                  size: 12,
                  fontWeight: FontWeight.normal,
                  color: ColorManager.grey2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
