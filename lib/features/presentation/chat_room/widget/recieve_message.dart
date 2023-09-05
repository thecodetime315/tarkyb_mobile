part of 'chat_room_imports.dart';

class ReceiverMessage extends StatelessWidget {
  final String message, date;
  ReceiverMessage({Key? key, required this.message, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          ChatBubble(
            clipper: ChatBubbleClipper5(
              type: BubbleType.receiverBubble,
            ),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            backGroundColor: Color(0xFFdaf0f9),
            child: Container(
              width: MediaQuery.of(context).size.width * .7,
              child: Text(
                message,
                style: TextStyle(
                  color: Color(0xFF4e6067),
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
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
