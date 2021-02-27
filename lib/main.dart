import 'package:flutter/material.dart';
import 'package:chat/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null)
      .then((value) => runApp(ModularApp(module: AppModule())));
}
