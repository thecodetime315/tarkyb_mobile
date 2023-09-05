part of 'chat_room_imports.dart';

class ChatRoomData {
  ChatRoomData._internal();
  static final ChatRoomData _instance = ChatRoomData._internal();
  factory ChatRoomData() => _instance;

  late TextEditingController messageController;
  late ScrollController scrollController;

  late GlobalKey<ScaffoldState> scaffoldState;

  final GenericCubit<List<ChatRoomModel>> chatListCubit = GenericCubit([]);
  ChatBaseRepo chatRepo = ChatRepoImpl();
  init(int orderId) {
    messageController = TextEditingController();
    scrollController = ScrollController();
    scaffoldState =   GlobalKey<ScaffoldState>();

    getRoomMessage(orderId: orderId);
  }

  void getRoomMessage({required int orderId}) async {
    var data = await chatRepo.getChat(orderId);
    if (data != []) {
      chatListCubit.onUpdateData(data);
    }
  }

  void sendMessage(int orderId) async {
    var data = await chatRepo.sendMessage(orderId, messageController.text);
    if (data) {
      getRoomMessage(orderId: orderId);

      messageController.clear();
    }
  }

  // void initializeSocket(BuildContext context, int roomID) {
  //   socket = io("http://kamenheraj.com:1631", <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //     'connectTimeout': 20000
  //   });
  //   socket!.on('connect_error', (data) {
  //     print('Connection error: $data');
  //   });
  //
  //   socket!.on('connect_timeout', (data) {
  //     print('Connection timeout: $data');
  //   });
  //   socket!.on('connect_failed', (data) {
  //     print('connect_failed: $data');
  //   });
  //
  //   socket!.connect();
  //
  //   log("==================================== ${socket!.connected} ===================================}"); // onnect the Socket.IO Client to the Server
  //   // --> listening for connection
  //   print("user_id: ${context.read<UserCubit>().state.model.id}");
  //   socket!.onConnecting((data) => print("conecting socket..."));
  //   socket!.onConnectError((data) => print("error : "+data.toString()));
  //   socket!.onConnectTimeout((data) => print(data.toString()));
  //   print("room_id: $roomID");
  //   socket!.on('connect', (data) {
  //     print("connect data  : $data");
  //     socket!.emit("enterChat", {
  //       "user_id": "${context.read<UserCubit>().state.model.id}",
  //       "room_id": "$roomID",
  //       "user_type": "User",
  //     });
  //   });
  //   log("==================================== ${socket!.connected} ===================================}"); // connect the Socket.IO Client to the Server
  //
  //   //listen for incoming messages from the Server.
  //   socket!.on('sendMessageRes', (data) {
  //     print("sendMessageRes : $data");
  //     allChatMessagesCubit.state.data?.messages?.chatMessage?.insert(
  //       0,
  //       ChatMessage(
  //         body: data['body'],
  //         id: data['id'],
  //         isSender: data['is_sender'],
  //         type: data['type'],
  //         duration: data['duration'],
  //         name: data['name'],
  //         createdDt: data['created_dt'],
  //       ),
  //     );
  //     allChatMessagesCubit.onUpdateData(allChatMessagesCubit.state.data);
  //     print("sendMessageRes : $data");
  //   });
  // }

  // void getFile({
  //   required BuildContext context,
  //   required int roomID,
  // }) async {
  //   final result = await Utils.getImage();
  //   if (result != null) {
  //     selectedFile.onUpdateData(result);
  //     final data = await ProviderRepository(context)
  //         .uploadFile(selectedFile.state.data, roomID);
  //     if (data !=null) {
  //       sendMessage(
  //         context: context,
  //         roomID: roomID,
  //         receiveFileModel: data,
  //         type: "file",
  //       );
  //     }else{
  //       CustomToast.showSnackBar(tr(context,"ErrorUploadingFile"),backgroundColor: Colors.redAccent);
  //     }
  //   } else {
  //     log("Error in get file");
  //   }
  // }

  // void sendMessage({
  //   required BuildContext context,
  //   required int roomID,
  //   String type = "text",
  // }) async {
  //   timeago.setLocaleMessages('ar', timeago.ArMessages());
  //   timeago.setLocaleMessages('en', timeago.EnMessages());
  //   if (messageController.text.isNotEmpty) {
  //     socket!.emit("sendMessage", {
  //       "room_id": "$roomID",
  //       "sender_id": "${context.read<UserCubit>().state.model.id}",
  //       "sender_name": "${context.read<UserCubit>().state.model.name}",
  //       "receiver_id": "${allChatMessagesCubit.state.data!.members?[0].id}",
  //       "receiver_name": "${allChatMessagesCubit.state.data!.members?[0].name}",
  //       "sender_type": "User",
  //       "receiver_type": "User",
  //       "lang": "ar",
  //       "type": type,
  //       "body": messageController.text,
  //       "isSender": 1,
  //     });
  //
  //     var result = await ChatRepo().sendMessage(roomID, messageController .text);
  //     if (result != null) {
  //       allChatMessagesCubit.state.data?.messages?.chatMessage?.insert(
  //         0,
  //         ChatMessage(
  //           id: result.id ?? 0,
  //           // body:type=="text"? messageController.text : R,
  //           body: result.body,
  //           createdDt: "${timeago.format(DateTime.now(), locale: "en")}",
  //           type: type,
  //           duration: 0,
  //           name: "${context.read<UserCubit>().state.model.name}",
  //           isSender: 1,
  //         ),
  //       );
  //       allChatMessagesCubit.onUpdateData(allChatMessagesCubit.state.data);
  //       context.read<ChatCubit>().getChats();
  //       messageController.clear();
  //     }
  //   }
  // }
}
