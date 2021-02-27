import 'dart:convert';

import 'package:chat/app/shared/repositories/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'auth_service.g.dart';

@Injectable()
class AuthService extends Disposable {
  AuthRepository _authRepository;
  IO.Socket socket;
  Map userData;
  AuthService(this._authRepository);

  void initConnection() {
    socket = IO.io(
      "http://10.0.2.2:3000/",
      IO.OptionBuilder()
          .enableAutoConnect()
          .setTransports(["websocket"]).build(),
    );
  }

  Future<bool> login({String name}) async {
    try {
      await _authRepository.saveData(
        "user",
        {
          "name": name,
        },
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future getData() async {
    try {
      final result = await _authRepository.getData("user");
      userData = json.decode(result);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> logout() async {
    try {
      await _authRepository.removeData("user");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void dispose() {}
}
