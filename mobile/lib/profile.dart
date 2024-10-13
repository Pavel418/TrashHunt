import 'package:flutter/material.dart';
import 'package:junction_project/users.dart';

class StandingsTable extends StatefulWidget {
  const StandingsTable({super.key});

  @override
  State<StandingsTable> createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable> {
  final List<Widget> rankingContainers = users.map((user) {
    return RankingContainer(
      rank: user.rank,
      name: user.name,
      score: user.score,
      profileImageUrl: user.imageUrl,
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: Image.asset(user3.imageUrl).image,
                  radius: 30,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rank: ${user3.rank}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user3.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'Score: ${user3.score}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Center(
            child: SizedBox(
          height: size.height * 0.7,
          child: ListView(
            children: rankingContainers,
          ),
        ))
      ],
    );
  }
}
