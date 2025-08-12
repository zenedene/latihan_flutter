import 'package:get/get.dart';

class Player {
  final String name;
  final String team;
  final String position;
  final String image;

  Player({
    required this.name,
    required this.team,
    required this.position,
    required this.image,
  });

  Player copyWith({
    String? name,
    String? team,
    String? position,
    String? image,
  }) {
    return Player(
      name: name ?? this.name,
      team: team ?? this.team,
      position: position ?? this.position,
      image: image ?? this.image,
    );
  }
}

class FootballController extends GetxController {
  var players = <Player>[
    Player(
      name: 'Lionel Messi',
      team: 'PSG',
      position: 'Forward',
      image: 'assets/images/placeholder.jpeg',
    ),
    Player(
      name: 'Cristiano Ronaldo',
      team: 'Al Nassr',
      position: 'Forward',
      image: 'assets/images/placeholder.jpeg',
    ),
    Player(
      name: 'Neymar Jr',
      team: 'Al Hilal',
      position: 'Forward',
      image: 'assets/images/placeholder.jpeg',
    ),
  ].obs;
}
