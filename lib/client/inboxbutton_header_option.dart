class InboxButtonHeaderOption {
  final String basePath;
  final String apiKey;
  final String userEmail;
  final bool isDebug;

  InboxButtonHeaderOption(
      {required this.basePath,
      required this.apiKey,
      required this.userEmail,
      this.isDebug = false});
}
