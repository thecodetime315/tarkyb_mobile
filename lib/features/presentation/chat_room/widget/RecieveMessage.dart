part of 'RoomWidgetsImports.dart';

class ReceiverMessage extends StatelessWidget {
  final ChatRoomModel messageModel;

  ReceiverMessage({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * .7,
      child: Column(
        children: [
          ChatBubble(
            clipper: ChatBubbleClipper3(
              type: BubbleType.receiverBubble,
            ),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            backGroundColor: Color(0xFFdaf0f9),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .7,
              child: MyText(title: messageModel.message ?? "",
                color: ColorManager.black,
                size: 17, fontWeight: FontWeight.normal,),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              messageModel.createdAt ?? 'createdDt',
              style: TextStyle(
                color: ColorManager.black,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
