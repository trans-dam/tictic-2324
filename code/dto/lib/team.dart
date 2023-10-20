import 'package:dto/transaction.dart';
import 'package:dto/user.dart';

class Team {
  final String title;
  final String? picturePath;
  final List<String>? tags;
  final DateTime startDate;
  final User owner;
  final List<User> users;
  final List<Transaction>? transactions;

  const Team(
      {required this.title,
      required this.owner,
      this.picturePath,
      this.tags,
      this.transactions,
      required this.startDate,
      required this.users});

  getSum() {
    double sum = 0;
    if (transactions != null) {
      for (var transaction in transactions!) {
        sum += transaction.amount;
      }
    }
    return sum;
  }
}

List<Team> teams = [
  Team(
    title: "💻 Code Magicians",
    picturePath: "assets/img/team-1.png",
    startDate: DateTime(2023, 8, 31),
    owner: fictiveUsers[0],
    users: [fictiveUsers[0], fictiveUsers[1], fictiveUsers[2]],
    transactions: transactionsList.sublist(0, 5),
    tags: const ["Coding", "Magic", "Geeks"],
  ),
  Team(
    title: "🌐 Web Weavers",
    picturePath: "assets/img/team-2.png",
    startDate: DateTime(2023, 9, 15),
    owner: fictiveUsers[3],
    users: [fictiveUsers[3], fictiveUsers[4], fictiveUsers[5]],
    transactions: transactionsList.sublist(5, 10),
    tags: const ["Web Development", "Design", "Networking"],
  ),
  Team(
    title: "🎮 Game Gurus",
    picturePath: "assets/img/team-3.png",
    startDate: DateTime(2023, 9, 30),
    owner: fictiveUsers[0],
    users: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
    transactions: transactionsList.sublist(10, 15),
  ),
  Team(
    title: "✨ nouveau groupe",
    picturePath: "assets/img/team-4.png",
    startDate: DateTime(2023, 9, 30),
    owner: fictiveUsers[0],
    users: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
    //transactions: transactionsList.sublist(10, 15),
  ),
];
