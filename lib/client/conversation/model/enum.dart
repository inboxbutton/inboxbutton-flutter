// ignore_for_file: constant_identifier_names

enum ConversationPriority { Low, Medium, High, Unknown }

enum ConversationStatus { Draft, Active, Unknown }

enum CreateConversationChannel { InApp, MobilePush, Email, Sms, Unknown }

//didn't use pascal cause it is not enum in backend
enum ConversationCategory { sent, draft, deleted, received }
