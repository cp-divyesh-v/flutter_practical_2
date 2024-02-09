import 'package:flutter/services.dart';
import 'dart:convert';

import '../../Utils/JSONReader.dart';
import '../Models/User.dart';


final class UserRepository {
  static final shared = UserRepository();

  Future<User> getUser() async {
    final data = await readJson('assets/dummy_data.json');
    return User.fromJson(data);
  }
}
