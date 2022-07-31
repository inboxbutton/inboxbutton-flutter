//create a stateful widget according to filename in pascal case
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:inboxbutton_flutter_app/inboxbutton_theme.dart';
import 'package:inboxbutton_flutter_app/screen/conversation_detail/provider/message_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ConversationDetailScreen extends StatefulWidget {
  static Widget route(String conversationId) => ChangeNotifierProvider(
        create: (context) => MessageListModel(conversationId: conversationId),
        child: const ConversationDetailScreen(),
      );
  const ConversationDetailScreen({Key? key}) : super(key: key);
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
          title: Text('Message'),
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
    return Consumer<MessageListModel>(
      builder: (BuildContext context, MessageListModel model, Widget? child) {
        var isEmpty = model.messageDtoList.isEmpty;
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

            Provider.of<MessageListModel>(context, listen: false).load();
          },
          onLoading: () async {
            //TODO: load next page
            Provider.of<MessageListModel>(context, listen: false).loadMore();
          },
          header: ClassicHeader(),
          footer: ClassicFooter(),
          child: isEmpty ? _emptyView() : _sectionContent(model),
        );
      },
    );
  }

  Widget _sectionContent(MessageListModel model) {
    var messageList = model.messageDtoList;
    return ListView.separated(
        itemBuilder: (context, index) => _biddingItem(context, model, index),
        separatorBuilder: (context, index) => Divider(),
        itemCount: messageList.length);
  }

  Widget _biddingItem(BuildContext context, MessageListModel model, int index) {
    var message = model.messageDtoList[index];
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      isThreeLine: false,
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text(
          (message.creatorId ?? "A").substring(0, 1),
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        message.id ?? "",
      ),
      subtitle: Html(data: message.body ?? ""),
      onTap: () {},
    );
  }

  Widget _emptyView() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Text('You do not have any messages yet.'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<MessageListModel>(context, listen: false).load();
  }
}
