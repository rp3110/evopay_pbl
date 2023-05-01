class ModelChatMatchData {
  final String score;
  final String timing;
  final String team1;
  final String team1Logo;
  final String team2;
  final String team2Logo;

  ModelChatMatchData(
      {required this.score,
      required this.team1,
      required this.team1Logo,
      required this.team2,
      required this.team2Logo,
      required this.timing});
}
