import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:base_flutter/features/presentation/notifications/widgets/build_notification_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/app_loader_helper.dart';
import 'cubits/notifications_cubit.dart';


class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);
  final scrollController = ScrollController();
  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0);
        // BlocProvider.of<NotificationsCubit>(context).loadedNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return Scaffold(
      body: CustomAppBar(
        title: "الاشعارات",
        needNotify: false,
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsLoaded) {
              return state.notifications.length != 0 ? Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomButton(
                        onTap: (){
                          // context.read<NotificationsCubit>().deleteAllNotifications();
                        },
                        title: tr(context, "deleteNotification"),
                        color: ColorManager.white,
                        width: 130,
                        height: 40,
                        borderColor: ColorManager.error,
                        textColor: ColorManager.error,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        itemCount: state.notifications.length,
                        itemBuilder: (_, index) {
                          return BuildNotificationItem(
                            model: state.notifications[index],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ): Expanded(child: Center(child: MyText(title: tr(context, "noData")),));
            }
            return Expanded(
              child: Center(
                child: AppLoaderHelper.showSimpleLoading(),
              ),
            );
          },
        ),
      ),
    );
  }
}
