//create a stateful widget according to filename in pascal case
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:inboxbutton_flutter_app/inboxbutton_theme.dart';
import 'package:inboxbutton_flutter_app/screen/conversation_list/provider/conversation_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../conversation_detail/conversation_detail_screen.dart';

class ConversationListScreen extends StatefulWidget {
  static Widget get route => ChangeNotifierProvider(
        create: (context) => ConversationListModel(),
        child: const ConversationListScreen(),
      );
  const ConversationListScreen({Key? key}) : super(key: key);
  @override
  _ConversationListScreenState createState() => _ConversationListScreenState();
}

class _ConversationListScreenState extends State<ConversationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: InboxButtonTheme.of(context).data,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Conversation'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: _body(),
      ),
    );
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Widget _body() {
    return Consumer<ConversationListModel>(
      builder:
          (BuildContext context, ConversationListModel model, Widget? child) {
        var isEmpty = model.conversationDtoList.isEmpty;
        if (_refreshController.isRefresh) {
          _refreshController.refreshCompleted();
        }
        if (_refreshController.isLoading) {
          if (model.isLastPage) {
            _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        }
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: () async {
            //TODO: refresh

            Provider.of<ConversationListModel>(context, listen: false).load();
          },
          onLoading: () async {
            //TODO: load next page
            Provider.of<ConversationListModel>(context, listen: false)
                .loadMore();
          },
          header: ClassicHeader(),
          footer: ClassicFooter(),
          child: isEmpty ? _emptyView() : _sectionContent(model),
        );
      },
    );
  }

  Widget _sectionContent(ConversationListModel model) {
    var conversationList = model.conversationDtoList;
    return ListView.separated(
        itemBuilder: (context, index) =>
            _conversationItem(context, model, index),
        separatorBuilder: (context, index) => Divider(),
        itemCount: conversationList.length);
  }

  Widget _conversationItem(
      BuildContext context, ConversationListModel model, int index) {
    var conversationId = model.conversationDtoList[index];
    var htmlString = conversationId.body ?? "";
    List<String> cleanStrings = [];
    List<dom.Element> ps =
        parse(htmlString.replaceAll('<br>', '</p><p>')).querySelectorAll('p');
    if (ps.isNotEmpty) {
      for (var f in ps) {
        if (f.text != '') cleanStrings.add(f.text);
      }
    }
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      isThreeLine: false,
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text(
          (conversationId.from?.name ?? "A").substring(0, 1),
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        "${conversationId.subject ?? ""}",
      ),
      subtitle: cleanStrings.isNotEmpty
          ? Text(
              "${cleanStrings.first}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          : Text(
              conversationId.body ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      onTap: () {
        //navigate to Conversation Detail Screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ConversationDetailScreen.route(conversationId.id ?? "")));
      },
    );
  }

  Widget _emptyView() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Text('You do not have any conversations yet.'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ConversationListModel>(context, listen: false).load();
  }
}
