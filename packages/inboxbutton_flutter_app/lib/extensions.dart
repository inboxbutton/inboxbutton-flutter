import 'package:flutter/material.dart';
import 'package:inboxbutton_flutter/inboxbutton_flutter.dart';

import 'inboxbutton_flutter_app.dart';
import 'inboxbutton_theme.dart';

extension InboxButtonSdkExtension on InboxButtonSdk {
  //create a method called startInboxButtonApp that accept one parameter called context
  void startInboxButtonApp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InboxButtonApp()),
    );
  }
}
