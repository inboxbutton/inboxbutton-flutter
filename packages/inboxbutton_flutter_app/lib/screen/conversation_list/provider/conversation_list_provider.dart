import 'package:flutter/cupertino.dart';
import 'package:inboxbutton_flutter/client/conversation/model/conversation_dto.dart';
import 'package:inboxbutton_flutter/inboxbutton_flutter.dart';

class ConversationListModel extends ChangeNotifier {
  List<ConversationDto> _conversationDtoList = [];
  List<ConversationDto> get conversationDtoList => _conversationDtoList;
  var _currentPage = 1;
  var _perPage = 10;
  var _lastPage = 99;
  bool get isLastPage => _currentPage == _lastPage;
  set perPage(value) {
    _perPage = value;
  }

  Future<void> load() async {
    _currentPage = 1;
    final conversationList = await InboxButtonSdk.instance
        .getUserConversations(page: _currentPage, perPage: _perPage);
    _lastPage = conversationList.metadata?.totalPages ?? 99;
    _conversationDtoList = conversationList.items ?? [];
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (isLastPage) {
      notifyListeners();
      return;
    }
    _currentPage++;
    final conversationList = await InboxButtonSdk.instance
        .getUserConversations(page: _currentPage, perPage: _perPage);
    _lastPage = conversationList.metadata?.totalPages ?? 99;

    _conversationDtoList.addAll(conversationList.items?.toList() ?? []);
    notifyListeners();
  }
}
