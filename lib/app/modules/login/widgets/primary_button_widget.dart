import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../login_controller.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    Key key,
    @required this.controller,
    @required this.onPressed,
  }) : super(key: key);

  final LoginController controller;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        height: 50,
        width: double.infinity,
        child: RaisedButton(
          onPressed: controller.validatorName ? onPressed : null,
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: Text("Acessar".toUpperCase()),
        ),
      );
    });
  }
}
