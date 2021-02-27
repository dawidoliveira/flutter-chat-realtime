import 'package:chat/app/modules/home/models/message.dart';
import 'package:chat/app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uuid/uuid.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ObservableList<MessageModel> messages = ObservableList<MessageModel>();
  AuthService _authService;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @observable
  TextEditingController textController = TextEditingController();

  @observable
  String message;
  @action
  void setMessage(String value) => message = value;

  _HomeControllerBase(this._authService) {
    this.getAllMessages();
    _authService.socket.on("receiveMessage", (data) {
      final MessageModel msg = MessageModel.fromJson(data);
      messages.insert(0, msg);
    });
  }

  @action
  void getAllMessages() {
    _authService.socket.emit("requestMessages");
    _authService.socket.on("listMessages", (data) {
      final List msgs = data;
      msgs.sort((a, b) => MessageModel.fromJson(b)
          .date
          .compareTo(MessageModel.fromJson(a).date));
      messages.insertAll(0, msgs.map((e) => MessageModel.fromJson(e)));
    });
  }

  @computed
  bool get validatorMessage => message != null && message.length > 0;

  bool isSender(int index) =>
      _authService.userData["name"].trim().toUpperCase() ==
      messages[index].sender.trim().toUpperCase();

  @action
  void addMessage() {
    final name = _authService.userData["name"];
    final socket = _authService.socket;
    final uuid = Uuid().v4();
    final hour = DateFormat('HH:mm').format(DateTime.now());
    if (textController.text.isEmpty) {
      return;
    }

    messages.insert(
      0,
      MessageModel(
        id: uuid,
        message: this.textController.text,
        sender: name,
        date: hour,
      ),
    );
    socket.emit("sendMessage", {
      "id": uuid,
      "sender": name,
      "message": this.textController.text,
      "date": hour,
    });
    textController.clear();
  }

  Future logout() async {
    if (await _authService.logout()) Modular.to.pushReplacementNamed('/login');
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Erro ao sair do app, tente novamente!"),
        backgroundColor: Colors.red,
      ),
    );
  }
}
