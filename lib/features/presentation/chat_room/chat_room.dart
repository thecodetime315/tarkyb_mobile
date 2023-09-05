part of 'chat_room_imports.dart';

class ChatRoom extends StatefulWidget {
  final int orderId;
  final String name;

  const ChatRoom({
    key,
    required this.orderId,
    required this.name,
  }) : super(key: key);

  @override
  ChatRoomState createState() => ChatRoomState();
}

class ChatRoomState extends State<ChatRoom> {
  final ChatRoomData chatRoomData = ChatRoomData();
  @override
  void initState() {
    chatRoomData.init(widget.orderId);
    super.initState();
  }

  @override
  void dispose() {
    chatRoomData.messageController.dispose();
    chatRoomData.scrollController.dispose();
    chatRoomData.scaffoldState.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      scaffoldKey: chatRoomData.scaffoldState,
      title: widget.name,
      needNotify: false,
      child: Column(
        children: [
          BuildSendMessage(),
          Container(
            alignment: Alignment.bottomCenter,
            child: BuildChatField(
              // doctorId: widget.doctorID,
              roomID: widget.orderId,
              // doctorName: widget.title,
            ),
          ),
        ],
      ),
    );
  }
}
