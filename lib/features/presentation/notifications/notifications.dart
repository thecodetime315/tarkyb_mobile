import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:base_flutter/features/presentation/notifications/widgets/build_notification_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/app_loader_helper.dart';
import 'cubits/notifications_cubit.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

    return  BlocProvider(
      create: (context) => NotificationsCubit()..loadedNotifications(),
      child: CustomAppBar(
        scaffoldKey:scaffoldState ,
        title: "الاشعارات",
        needNotify: false,
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsLoaded) {
              return state.notifications.length != 0
                  ? Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
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
                    )
                  : Expanded(
                      child: Center(
                      child: MyText(title: "لا يوجد اشعارات"),
                    ));
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
