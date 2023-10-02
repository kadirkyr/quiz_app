class Team {
  final String team;
  final String logo;
  late final String getLogo = "assets/images/logos/$logo.png";

  Team({required this.team, required this.logo});
}

class TeamItems {
  List<Team> teams = [
    Team(team: "Fenerbahçe", logo: "fenerbahce"),
    Team(team: "Atletico Madrid", logo: "atletico"),
    Team(team: "Real Madrid", logo: "realMadrid"),
    Team(team: "Barcelona FC", logo: "barcelona"),
    Team(team: "Arsenal", logo: "arsenal"),
    Team(team: "Beşiktaş", logo: "besiktas"),
    Team(team: "Chelsea FC", logo: "chelsea"),
    Team(team: "Galatasaray SK", logo: "galatasaray"),
    Team(team: "Manchester United", logo: "manUtd"),
    Team(team: "Internazionale", logo: "inter"),
    Team(team: "Paris Saint-Germain", logo: "psg"),
    Team(team: "Marseille FC", logo: "marseille"),
    Team(team: "Liverpool", logo: "liverpool"),
  ];
}
