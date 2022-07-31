//create a stateful widget according to filename in pascal case
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../inboxbutton_theme.dart';

class ConversationDetailScreen extends StatefulWidget {
  const ConversationDetailScreen({
    Key? key,
  }) : super(key: key);
  @override
  _ConversationDetailScreenState createState() =>
      _ConversationDetailScreenState();
}

class _ConversationDetailScreenState extends State<ConversationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: InboxButtonTheme.of(context).data,
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}
