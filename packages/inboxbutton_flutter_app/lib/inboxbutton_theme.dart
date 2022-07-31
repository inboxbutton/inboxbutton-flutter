//create a inherited widget for inboxbutton_theme

import 'package:flutter/material.dart';

class InboxButtonTheme extends InheritedWidget {
  final ThemeData data;
  const InboxButtonTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);
  @override
  bool updateShouldNotify(InboxButtonTheme oldWidget) => data != oldWidget.data;
  static InboxButtonTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InboxButtonTheme>()!;
  }
}
