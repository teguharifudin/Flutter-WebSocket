import 'package:flutter/material.dart';
import 'package:client/core/message_model.dart';
import 'package:client/core/websocket_manager.dart';

mixin class ChatViewManager {
  List<MessageModel> messages = [];
  final TextEditingController msgController = TextEditingController();

  listenMessageEvent(VoidCallback setState) {
    WebSocketManager.instance.webSocketReceiver("chat_update", (data) {
      messages.add(MessageModel.fromJson(data));
      setState();
    });
  }

  sendMessage(String sender, VoidCallback setState) {
    final MessageModel data =
        MessageModel(sender: sender, msg: msgController.text);
    WebSocketManager.instance.webSocketSender("chat_update", data.toJson());
    //Reset input
    msgController.text = "";
    setState();
  }

  Alignment setMessageAlignment(String senderName, String userName) {
    switch (senderName == userName) {
      case true:
        return Alignment.topRight;
      case false:
        return Alignment.topLeft;
    }
  }
}
