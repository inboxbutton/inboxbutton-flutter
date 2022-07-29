import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inboxbutton_flutter/client/conversation/model/create_conversation_dto.dart';
import 'package:inboxbutton_flutter/client/conversation/model/reply_conversation_dto.dart';
import 'package:inboxbutton_flutter/client/conversation/model/update_conversation_dto.dart';
import 'package:inboxbutton_flutter/inboxbutton_exception.dart';
import 'package:inboxbutton_flutter/inboxbutton_flutter.dart';

void main() {
  InboxButtonSdk.instance
      .setup("1ab2c3d4e5f61ab2c3d4e5f603u1d78620de67282882a84", isDebug: true);

  InboxButtonSdk.instance.setUserEmail("creator@email.com");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String conversationId = "";
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          //setting icon button
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Builder(
        builder: (BuildContext context) => Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Conversation ID: $conversationId"),
                ),
                //Copy icon button
                IconButton(
                  icon: const Icon(Icons.content_copy),
                  onPressed: () {
                    FlutterClipboard.copy(conversationId)
                        .then((value) => showSnackBar(context, "Copied"));
                  },
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: const Text("Create conversation"),
                  onTap: () async {
                    try {
                      var requestJson = jsonDecode(await rootBundle
                          .loadString("assets/create_conversation.json"));
                      var createConversationDto =
                          CreateConversationDto.fromJson(requestJson);
                      var response = await InboxButtonSdk.instance
                          .createConversation(createConversationDto);
                      conversationId = response.id ?? "";
                      setState(() {});
                      await showModal(context, response.toJson(), requestJson);
                    } on InboxButtonException catch (onError) {
                      await showModal(
                          context, onError.errorResponse.toJson(), null);
                    }
                  },
                ),
                ListTile(
                  title: const Text("Update conversation"),
                  onTap: () async {
                    try {
                      if (conversationId.isEmpty) {
                        showSnackBar(
                            context, "Please create conversation first");
                        return;
                      }
                      var requestJson = jsonDecode(await rootBundle
                          .loadString("assets/update_conversation.json"));
                      var updateConversationDto =
                          UpdateConversationDto.fromJson(requestJson);
                      var response = await InboxButtonSdk.instance
                          .updateConversation(
                              conversationId, updateConversationDto);
                      await showModal(context, response.toJson(), requestJson);
                    } on InboxButtonException catch (onError) {
                      await showModal(
                          context, onError.errorResponse.toJson(), null);
                    }
                  },
                ),
                ListTile(
                  title: const Text("list conversation"),
                  onTap: () async {
                    try {
                      var response =
                          await InboxButtonSdk.instance.listConversation();
                      await showModal(context, response.toJson(), null);
                    } on InboxButtonException catch (onError) {
                      await showModal(
                          context, onError.errorResponse.toJson(), null);
                    }
                  },
                ),
                ListTile(
                  title: const Text("Get conversation"),
                  onTap: () async {
                    try {
                      if (conversationId.isEmpty) {
                        showSnackBar(
                            context, "Please create conversation first");
                        return;
                      }
                      var response = await InboxButtonSdk.instance
                          .getConversation(conversationId);
                      await showModal(context, response.toJson(), null);
                    } on InboxButtonException catch (onError) {
                      await showModal(
                          context, onError.errorResponse.toJson(), null);
                    }
                  },
                ),
                ListTile(
                  title: const Text("read conversation"),
                  onTap: () async {
                    try {
                      if (conversationId.isEmpty) {
                        showSnackBar(
                            context, "Please create conversation first");
                        return;
                      }
                      var response = await InboxButtonSdk.instance
                          .readConversation(conversationId);
                      await showModal(context, response.toJson(), null);
                    } on InboxButtonException catch (onError) {
                      await showModal(
                          context, onError.errorResponse.toJson(), null);
                    }
                  },
                ),
                ListTile(
                  title: const Text("Delete conversation"),
                  onTap: () async {
                    try {
                      if (conversationId.isEmpty) {
                        showSnackBar(
                            context, "Please create conversation first");
                        return;
                      }
                      var response = await InboxButtonSdk.instance
                          .deleteConversation(conversationId);
                      conversationId = "";
                      setState(() {});
                      await showModal(context, response.toJson(), null);
                    } on InboxButtonException catch (onError) {
                      await showModal(
                          context, onError.errorResponse.toJson(), null);
                    }
                  },
                ),
                ListTile(
                  title: const Text("Get messages by conversation id"),
                  onTap: () async {
                    try {
                      if (conversationId.isEmpty) {
                        showSnackBar(
                            context, "Please create conversation first");
                        return;
                      }
                      var response = await InboxButtonSdk.instance
                          .getMessages(conversationId);
                      await showModal(context, response.toJson(), null);
                    } on InboxButtonException catch (onError) {
                      await showModal(
                          context, onError.errorResponse.toJson(), null);
                    }
                  },
                ),
                ListTile(
                  title: const Text("Reply conversation"),
                  onTap: () async {
                    try {
                      if (conversationId.isEmpty) {
                        showSnackBar(
                            context, "Please create conversation first");
                        return;
                      }
                      var requestJson = jsonDecode(await rootBundle
                          .loadString("assets/reply_conversation.json"));
                      var replyConversationDto =
                          ReplyConversationDto.fromJson(requestJson);
                      var response = await InboxButtonSdk.instance
                          .replyConversation(
                              conversationId, replyConversationDto);
                      await showModal(context, response.toJson(), null);
                    } on InboxButtonException catch (onError) {
                      await showModal(
                          context, onError.errorResponse.toJson(), null);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<dynamic> showModal(BuildContext context, Map<String, dynamic> response,
      Map<String, dynamic>? requestJson) async {
    return await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return JsonViewer(
            requestPayload:
                requestJson == null ? null : prettyPrint(requestJson),
            responsePayload: prettyPrint(response),
          );
        });
  }

  //pretty print string
  String prettyPrint(Map<String, dynamic> json) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    var jsonString = encoder.convert(json);
    return jsonString;
  }
}

//create new stateful widget called JsonViewer
class JsonViewer extends StatefulWidget {
  final String? requestPayload;
  final String responsePayload;

  const JsonViewer({
    Key? key,
    required this.responsePayload,
    this.requestPayload,
  }) : super(key: key);
  @override
  _JsonViewerState createState() => _JsonViewerState();
}

class _JsonViewerState extends State<JsonViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Viewer"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (widget.requestPayload != null) ...[
                  Text(
                    "type: request\n",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text("${widget.requestPayload}\n\n"),
                ],
                Text(
                  "type: response\n",
                  style: TextStyle(fontSize: 24),
                ),
                Text("${widget.responsePayload}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
