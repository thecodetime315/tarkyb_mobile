


import 'package:base_flutter/features/models/chat_room_model.dart';
import 'package:base_flutter/features/presentation/chat_room/resources/chat_base_repo.dart';

import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';

class ChatRepoImpl extends ChatBaseRepo{
  Future<List<ChatRoomModel>> getChat(int id) async {
    var data = await DioHelper().get(
      url: AppStringsManager.chats + "$id",
    );
    if (data != null) {
      return List<ChatRoomModel>.from(
          data["data"].map((e) => ChatRoomModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> sendMessage(int id,String message) async {
    Map<String,dynamic> body = {
      "message" : message,
    };
    var data = await DioHelper().post(url: AppStringsManager.sendChatMessage + "$id", body: body);
    if(data != null){
      return true;
    }else{
      return false;
    }
  }
}