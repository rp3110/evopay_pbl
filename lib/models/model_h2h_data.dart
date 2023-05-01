class ModelH2HData {
  final String team1;
  final String team2;
  final String team1Win;
  final String team2Win;
  final int team1WinPercentage;
  final int team2WinPercentage;
  final String draw;
  final int drawPercentage;
  final List<ModelMatchListData> matchList;

  ModelH2HData({
    required this.team1,
    required this.team2,
    required this.team1Win,
    required this.team2Win,
    required this.team1WinPercentage,
    required this.team2WinPercentage,
    required this.draw,
    required this.drawPercentage,
    required this.matchList,
  });
}

class ModelMatchListData {
  final String dateAndTime;
  final String score;

  ModelMatchListData({required this.dateAndTime, required this.score});
}
