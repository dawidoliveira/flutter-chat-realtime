import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return FutureBuilder<bool>(
        future: controller.init(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data)
            Future.delayed(Duration(seconds: 2),
                () => Navigator.of(context).pushReplacementNamed('/home'));
          return Scaffold(
            body: Container(
              height: _size.height,
              width: _size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.chat_outlined,
                      size: _size.width / 3.5,
                    ),
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        });
  }
}
