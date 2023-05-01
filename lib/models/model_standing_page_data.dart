class ModelStandingPageData {
  final String team;
  final String p;
  final String gd;
  final String pts;
  final String logo;
  final bool isHighlighted;
  final bool isBold;

  ModelStandingPageData({
    required this.team,
    required this.p,
    required this.gd,
    required this.pts,
    required this.logo,
    this.isHighlighted = false,
    this.isBold = false,
  });
}
