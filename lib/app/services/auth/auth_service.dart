import 'dart:convert';

import 'package:chat/app/shared/repositories/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_service.g.dart';

@Injectable()
class AuthService extends Disposable {
  AuthRepository _authRepository;
  Map userData;
  AuthService(this._authRepository);

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

  @override
  void dispose() {}
}
