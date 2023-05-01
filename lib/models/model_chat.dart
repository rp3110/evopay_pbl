class ModelChat {
  final String userName;
  final String currentTime;
  final String profilePicture;
  final List<ModelMessage> chatList;

  ModelChat(
      {required this.profilePicture,
      required this.userName,
      required this.currentTime,
      required this.chatList});
}

class ModelMessage {
  final String name;
  final String time;
  final String message;
  final bool isSender;
  final String profilePicture;

  ModelMessage({
    required this.name,
    required this.time,
    required this.message,
    this.isSender = false,
    required this.profilePicture,
  });
}
