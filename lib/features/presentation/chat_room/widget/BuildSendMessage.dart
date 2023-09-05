part of 'RoomWidgetsImports.dart';

class BuildSendMessage extends StatelessWidget {
  const BuildSendMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GenericCubit<List<ChatRoomModel>>,
          GenericState<List<ChatRoomModel>>>(
        bloc: ChatRoomData().chatListCubit,
        builder: (context, messageState) {
          if (messageState is GenericUpdateState) {
            return ListView.builder(
              controller: ChatRoomData().scrollController,
              itemCount: messageState.data.length ,
              padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
              itemBuilder: (context, index) {
                if (index < messageState.data.length) {
                  return Column(
                    children: [
                      if (messageState.data[index].senderId?.id ==
                          context.read<UserCubit>().state.model.id)
                        Row(
                          mainAxisAlignment: context
                                      .read<LangCubit>()
                                      .state
                                      .locale
                                      .languageCode ==
                                  "ar"
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                            SenderMessage(
                              messageModel: messageState.data[index],
                            ),
                          ],
                        ),
                      if (messageState.data[index].senderId?.id !=
                          context.read<UserCubit>().state.model.id)
                        Row(
                          mainAxisAlignment: context
                                      .read<LangCubit>()
                                      .state
                                      .locale
                                      .languageCode ==
                                  "ar"
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            ReceiverMessage(
                              messageModel: messageState.data[index],
                            ),
                          ],
                        ),
                    ],
                  );
                } else {
                  return Center(
                    child: AppLoaderHelper.showSimpleLoading(),
                  );
                }
              },
            );
          } else {
            return Center(
                child: MyText(
              title: "لا يوجد بيانات",
            ));
          }
        },
      ),
    );
  }
}
