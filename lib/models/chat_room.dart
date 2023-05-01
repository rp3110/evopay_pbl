class ChatRoom {
  final String name;
  final String groupTeamName;
  final String groupNameShortcut;
  final String homeTeamName;
  final String awayTeamName;
  final int memberCount;
  final String language;
  final bool isInvited;

  ChatRoom(
      {required this.name,
      required this.groupTeamName,
      required this.groupNameShortcut,
      required this.homeTeamName,
      required this.awayTeamName,
      required this.memberCount,
      required this.language,
      required this.isInvited});
}
