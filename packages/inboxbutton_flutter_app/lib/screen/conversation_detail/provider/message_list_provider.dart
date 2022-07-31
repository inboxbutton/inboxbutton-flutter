import 'package:flutter/cupertino.dart';
import 'package:inboxbutton_flutter/client/conversation/model/message_dto.dart';
import 'package:inboxbutton_flutter/inboxbutton_flutter.dart';

class MessageListModel extends ChangeNotifier {
  List<MessageDto> _messageDtoList = [];
  List<MessageDto> get messageDtoList => _messageDtoList;
  var _currentPage = 1;
  var _perPage = 10;
  var _lastPage = 99;
  bool get isLastPage => _currentPage == _lastPage;

  final String conversationId;

  MessageListModel({required this.conversationId});

  set perPage(value) {
    _perPage = value;
  }

  Future<void> load() async {
    _currentPage = 1;
    final messageList = await InboxButtonSdk.instance
        .getMessages(conversationId, page: _currentPage, perPage: _perPage);
    _lastPage = messageList.metadata?.totalPages ?? 99;
    _messageDtoList = messageList.items ?? [];
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (isLastPage) {
      notifyListeners();
      return;
    }
    _currentPage++;
    final messageList = await InboxButtonSdk.instance
        .getMessages(conversationId, page: _currentPage, perPage: _perPage);
    _lastPage = messageList.metadata?.totalPages ?? 99;

    _messageDtoList.addAll(messageList.items?.toList() ?? []);
    notifyListeners();
  }
}
