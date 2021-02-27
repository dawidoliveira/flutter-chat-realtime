import 'package:chat/app/services/auth/auth_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  AuthService _authService;
  _SplashControllerBase(this._authService);

  Future<bool> init() async {
    try {
      await _authService.getData();
      _authService.initConnection();
      if (_authService.userData == null) return false;
      return true;
    } catch (e) {
      return false;
    }
  }

  bool verifyLogin() {
    if (_authService.userData != null) {
      return true;
    }
    return false;
  }
}
