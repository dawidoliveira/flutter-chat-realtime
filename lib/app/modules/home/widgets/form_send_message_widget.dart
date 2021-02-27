import 'package:flutter/material.dart';

import '../home_controller.dart';
import 'button_send_message_widget.dart';
import 'text_input_message_widget.dart';

class FormSendMessageWidget extends StatelessWidget {
  const FormSendMessageWidget({
    Key key,
    @required this.controller,
    @required this.textController,
  }) : super(key: key);

  final HomeController controller;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          Expanded(
            child: TextInputMessageWidget(
              controller: controller,
            ),
          ),
          ButtonSendMessageWidget(controller: controller),
        ],
      ),
    );
  }
}
