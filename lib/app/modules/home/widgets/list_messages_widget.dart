import 'package:chat/app/modules/home/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home_controller.dart';
import 'item_message_widget.dart';

class ListMessagesWidget extends StatelessWidget {
  const ListMessagesWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        reverse: true,
        itemBuilder: (context, index) {
          MessageModel msg = controller.messages[index];
          return ItemMessageWidget(
            controller: controller,
            msg: msg,
            index: index,
          );
        },
        itemCount: controller.messages.length,
      );
    });
  }
}
