library inboxbutton_flutter;

class InboxButtonSdk {
  static final InboxButtonSdk _instance = InboxButtonSdk._internal();

  late String _apiKey;

  late String _secretKey;
  late String _userEmail;
  late bool _isDebug;
  factory InboxButtonSdk() => _instance;
  InboxButtonSdk._internal();
  static InboxButtonSdk get instance => _instance;

  void setup(String apiKey, String secretKey, {bool isDebug = true}) {
    InboxButtonSdk._internal();
    _apiKey = apiKey;
    _secretKey = secretKey;
    _isDebug = isDebug;
  }

  void setUserEmail(String userEmail) {
    _userEmail = userEmail;
  }
}
