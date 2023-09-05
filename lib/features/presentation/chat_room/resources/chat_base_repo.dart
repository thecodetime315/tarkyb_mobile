


import '../../../models/chat_room_model.dart';

abstract class ChatBaseRepo{
  Future<List<ChatRoomModel>> getChat(int id);
  Future<bool> sendMessage(int id,String message);
}