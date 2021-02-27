import 'package:chat/app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthService _authService;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  _LoginControllerBase(this._authService);

  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get validatorName => name != null && name.length >= 3;

  Future login() async {
    if (formKey.currentState.validate()) {
      final result = await _authService.login(
        name: name,
      );
      if (result) {
        await _authService.getData();
        Modular.to.pushReplacementNamed('/home');
      } else
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
                "Erro ao fazer login, verifique se os dados estão corretos!"),
            backgroundColor: Colors.red,
          ),
        );
    }
  }
}
