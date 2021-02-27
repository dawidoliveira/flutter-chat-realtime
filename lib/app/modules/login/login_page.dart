import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';
import 'widgets/form_login_widget.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      key: controller.scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: _size.width,
          height: _size.height,
          padding: const EdgeInsets.all(20.0),
          child: FormLoginWidget(
            size: _size,
            controller: controller,
            formKey: controller.formKey,
          ),
        ),
      ),
    );
  }
}
