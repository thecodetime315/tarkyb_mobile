part of 'RoomWidgetsImports.dart';

class SenderMessage extends StatelessWidget {
  final ChatRoomModel messageModel;
  SenderMessage({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          ChatBubble(
            clipper: ChatBubbleClipper3(
              type: BubbleType.sendBubble,
            ),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            backGroundColor: ColorManager.primary,
            child: Container(
              constraints:BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .7) ,
              child: MyText(title: messageModel.message ?? "",color: ColorManager.white,
                size: 17,fontWeight: FontWeight.normal,),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              messageModel.readAt ?? '',
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

