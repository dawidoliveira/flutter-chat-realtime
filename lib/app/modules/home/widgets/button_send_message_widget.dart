import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home_controller.dart';

class ButtonSendMessageWidget extends StatelessWidget {
  const ButtonSendMessageWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return IconButton(
        icon: Icon(
          Icons.send,
          color: controller.validatorMessage
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
        onPressed: controller.validatorMessage
            ? () {
                controller.addMessage();
                FocusScope.of(context).unfocus();
              }
            : null,
      );
    });
  }
}
