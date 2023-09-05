part of 'chat_room_imports.dart';

class BuildChatField extends StatefulWidget {

  const BuildChatField({Key? key,})
      : super(key: key);

  @override
  State<BuildChatField> createState() => _BuildChatFieldState();
}

class _BuildChatFieldState extends State<BuildChatField> {
  final TextEditingController chatController = TextEditingController();
  @override
  void dispose() {
    chatController.dispose();
    // widget.chatRoomData.messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10),
      child: CustomTextField(
        controller: chatController,
        hint: tr(context, "writeMessage"),
        validator: (value) => value?.noValidate(),
        fieldTypes: FieldTypes.chat,
        type: TextInputType.text,
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: (){},
        ),
      ),
    );
  }
}
