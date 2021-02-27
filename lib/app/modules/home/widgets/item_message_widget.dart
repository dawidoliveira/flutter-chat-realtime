import 'package:chat/app/modules/home/home_controller.dart';
import 'package:chat/app/modules/home/models/message.dart';
import 'package:flutter/material.dart';

class ItemMessageWidget extends StatelessWidget {
  const ItemMessageWidget({
    Key key,
    @required this.controller,
    @required this.msg,
    @required this.index,
  }) : super(key: key);

  final HomeController controller;
  final MessageModel msg;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: !controller.isSender(index)
          ? Alignment.centerLeft
          : Alignment.centerRight,
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding:
            const EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:
                !controller.isSender(index) ? Radius.zero : Radius.circular(20),
            topRight:
                controller.isSender(index) ? Radius.zero : Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: (!controller.isSender(index)
              ? Colors.grey.shade200
              : Colors.blue[200]),
        ),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!controller.isSender(index))
              Text(
                msg.sender,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            Text(
              msg.message,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              msg.date,
              style: TextStyle(color: Colors.grey[600], fontSize: 11),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
