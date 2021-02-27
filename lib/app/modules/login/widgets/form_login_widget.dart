import 'package:flutter/material.dart';
import '../login_controller.dart';
import 'primary_button_widget.dart';
import 'text_input_widget.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({
    Key key,
    @required Size size,
    @required this.controller,
    @required this.formKey,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final GlobalKey<FormState> formKey;
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              Icons.chat_outlined,
              size: _size.width / 3.5,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextInputWidget(
            controller: controller,
            labelText: "Nome",
            onChanged: controller.setName,
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(
            height: 30,
          ),
          PrimaryButtonWidget(
            controller: controller,
            onPressed: () async {
              await controller.login();
            },
          )
        ],
      ),
    );
  }
}
