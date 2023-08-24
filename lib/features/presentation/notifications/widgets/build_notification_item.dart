import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../cubits/notifications_cubit.dart';
import '../models/notifications_model.dart';

class BuildNotificationItem extends StatelessWidget {
  final NotificationsBody model;
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
                radius: 22,
                child: Image.asset(
                  AssetsManager.splashLogo,
                  width: 35,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SizedBox(
                width: context.width*0.15,
                child: MyText(
                  title: "${model.body}",
                  color: ColorManager.black,
                  size: 15,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  // context.read<NotificationsCubit>().deleteOneNotification(model.id ?? '');
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: ColorManager.error,
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
                  size: 14,
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
