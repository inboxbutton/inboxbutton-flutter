library inboxbutton_flutter_app;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inboxbutton_flutter_app/screen/conversation_list/conversation_list_screen.dart';

import 'inboxbutton_theme.dart';

class InboxButtonApp extends StatefulWidget {
  const InboxButtonApp({
    Key? key,
  }) : super(key: key);
  @override
  _InboxButtonAppState createState() => _InboxButtonAppState();
}

//create a state class for InboxButtonApp
class _InboxButtonAppState extends State<InboxButtonApp> {
  @override
  Widget build(BuildContext context) {
    return ConversationListScreen.route;
  }
}
