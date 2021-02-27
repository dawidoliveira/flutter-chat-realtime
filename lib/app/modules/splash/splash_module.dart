import 'package:chat/app/modules/home/home_page.dart';
import 'package:chat/app/modules/login/login_page.dart';

import 'splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'splash_page.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SplashController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter('/login', child: (_, args) => LoginPage()),
        ModularRouter('/home', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
