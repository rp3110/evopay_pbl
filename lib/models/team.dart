class Team {
  final String image;
  final String name;
  final String leagueName;
  bool isFavourite;
  bool? isSelected;

  Team({
    required this.image,
    required this.name,
    required this.isFavourite,
    required this.leagueName,
    this.isSelected,
  });
}
