class ModelGoalInfo {
  final String team1;
  final String team2;
  final String score;
  final List<GoalHistory> team1Goals;
  final List<GoalHistory> team2Goals;

  const ModelGoalInfo({
    required this.team1,
    required this.team2,
    required this.score,
    required this.team1Goals,
    required this.team2Goals,
  });
}

class GoalHistory {
  final String playerName;
  final String time;

  GoalHistory({required this.playerName, required this.time});
}
