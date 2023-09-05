part of 'RoomWidgetsImports.dart';

class BuildChatField extends StatefulWidget {
  final int roomID;

  const BuildChatField({
    Key? key,
    required this.roomID,

  }) : super(key: key);

  @override
  State<BuildChatField> createState() => _BuildChatFieldState();
}

class _BuildChatFieldState extends State<BuildChatField> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: ColorManager.grey1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 100,
                    minHeight: 50,
                  ),
                  child: TextFormField(
                    maxLines: null,
                    enabled: true,
                    keyboardType: TextInputType.multiline,
                    controller: ChatRoomData().messageController,
                    textInputAction: TextInputAction.newline,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 12,
                    ),
                    onFieldSubmitted: (val) => ChatRoomData().sendMessage(widget.roomID,),
                    // maxLines: 5,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      hintText: "رسالتك",
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: ColorManager.black,
                        fontFamily: FontConstants.fontFamily,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => ChatRoomData().sendMessage(
                   widget.roomID,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.send,
                    size: 25,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
