import 'package:flutter/material.dart';

class User {
  final String imageUrl;
  final String name;
  final int rank;
  final int score;

  User(
      {required this.imageUrl,
      required this.name,
      required this.rank,
      required this.score});
}

User user1 = User(
    imageUrl: 'assets/images/Elchin.jpeg', name: 'Elchin', rank: 1, score: 100);
User user2 = User(
    imageUrl: 'assets/images/Tamerlan.jpeg',
    name: 'Tamerlan',
    rank: 2,
    score: 90);
User user3 = User(
    imageUrl: 'assets/images/Husein.jpeg', name: 'Husein', rank: 3, score: 80);
User user4 = User(
    imageUrl: 'assets/images/Eldar.jpeg', name: 'Eldar', rank: 4, score: 70);
User user5 = User(
    imageUrl: 'assets/images/Elmar.jpeg', name: 'Elmar', rank: 5, score: 60);
User user6 = User(
    imageUrl: 'assets/images/Elnur.jpeg', name: 'Elnur', rank: 6, score: 50);

List<User> users = [user1, user2, user3, user4, user5, user6];

class RankingContainer extends StatelessWidget {
  final int rank;
  final String name;
  final int score;
  final String profileImageUrl;

  const RankingContainer({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '#$rank',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: rank == 1
                      ? Colors.orange
                      : rank == 2
                          ? Colors.grey
                          : rank == 3
                              ? Colors.brown
                              : Colors.black,
                ),
              ),
              const SizedBox(width: 20),
              CircleAvatar(
                radius: 20,
                backgroundImage: Image.asset(profileImageUrl).image,
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '$score Points',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          rank == 1
              ? const Icon(Icons.emoji_events, color: Colors.orange, size: 28)
              : rank == 2
                  ? const Icon(Icons.emoji_events, color: Colors.grey, size: 28)
                  : rank == 3
                      ? const Icon(Icons.emoji_events,
                          color: Colors.brown, size: 28)
                      : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
