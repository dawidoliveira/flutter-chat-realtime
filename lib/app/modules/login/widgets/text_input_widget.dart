import 'package:flutter/material.dart';

import '../login_controller.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    Key key,
    @required this.controller,
    this.prefixIcon,
    @required this.labelText,
    @required this.onChanged,
  }) : super(key: key);

  final LoginController controller;
  final IconData prefixIcon;
  final String labelText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      textCapitalization: TextCapitalization.words,
    );
  }
}
