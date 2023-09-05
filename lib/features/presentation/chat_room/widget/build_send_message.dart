part of 'chat_room_imports.dart';

class BuildSendMessage extends StatelessWidget {
  const BuildSendMessage({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-200,
      child: ListView.builder(
        itemCount: 10,
        reverse: true,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Column(
            children: [
              // if (messageState.data[index].isSender == 1)
                Row(
                  mainAxisAlignment:
                       MainAxisAlignment.start,

                  children: [
                    SenderMessage(
                      message: "1messageState.data[index].body1messageState.data[index].body1messageState.data[index].body",
                      date: "4:00 pm",
                    ),
                  ],
                ),
              // if (messageState.data[index].isSender == 0)
                Row(
                  mainAxisAlignment:  MainAxisAlignment.end,

                  children: [
                    ReceiverMessage(
                      message: "messageState.data[index].body",
                      date: "4:00 pm",
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
