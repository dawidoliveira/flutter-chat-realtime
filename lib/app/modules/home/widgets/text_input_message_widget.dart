import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home_controller.dart';

class TextInputMessageWidget extends StatelessWidget {
  const TextInputMessageWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: controller.textController,
        onChanged: controller.setMessage,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 10,
            bottom: 10,
            right: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: "Digite sua mensagem...",
        ),
        onFieldSubmitted: (value) {
          controller.addMessage();
        },
        maxLines: 5,
        minLines: 1,
      );
    });
  }
}
