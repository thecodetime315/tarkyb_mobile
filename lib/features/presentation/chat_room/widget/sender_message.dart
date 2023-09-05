part of 'chat_room_imports.dart';

class SenderMessage extends StatelessWidget {
  final String message, date;
  SenderMessage({Key? key, required this.message, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          ChatBubble(
            clipper: ChatBubbleClipper5(
              type: BubbleType.sendBubble,
            ),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            backGroundColor: ColorManager.primary,
            child: Container(
              width: MediaQuery.of(context).size.width * .7,
              child: Text(
                message,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              date,
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
