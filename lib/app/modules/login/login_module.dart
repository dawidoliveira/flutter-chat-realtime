import 'package:chat/app/modules/home/home_page.dart';
import 'package:chat/app/services/auth/auth_service.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get<AuthService>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter('/home', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
