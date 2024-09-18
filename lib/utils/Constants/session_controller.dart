// ignore_for_file: non_constant_identifier_names

import '../../Model/User.dart';

class SessionController {
  static final SessionController _SessionController =
      SessionController._internal();

  factory SessionController() {
    return _SessionController;
  }

  SessionController._internal();

  String supportEmail = "";
  String supportPhone = "";
  User user = User();
}
