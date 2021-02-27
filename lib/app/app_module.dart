import 'package:chat/app/modules/home/home_controller.dart';
import 'package:chat/app/modules/login/login_controller.dart';
import 'package:chat/app/modules/splash/splash_module.dart';

import 'services/auth/auth_service.dart';
import 'shared/repositories/auth/auth_repository.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:chat/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AuthService,
        $AuthRepository,
        $AppController,
        Bind((i) => HomeController(i.get<AuthService>())),
        Bind((i) => LoginController(i.get<AuthService>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
