import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_repository.g.dart';

@Injectable()
class AuthRepository extends Disposable {
  SharedPreferences _ps;

  Future saveData(String key, Map data) async {
    _ps = await SharedPreferences.getInstance();
    await _ps.setString(key, json.encode(data));
  }

  Future<String> getData(String key) async {
    _ps = await SharedPreferences.getInstance();
    return _ps.getString(key);
  }

  Future removeData(String key) async {
    _ps = await SharedPreferences.getInstance();
    await _ps.remove(key);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
