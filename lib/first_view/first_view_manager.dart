import 'package:flutter/cupertino.dart';
import 'package:client/chat_view/chat_view.dart';

mixin class FirstViewManager {
  final TextEditingController nameController = TextEditingController();

  navigateToChatView(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ChatView(name: nameController.text),
      ),
    );
  }
}
