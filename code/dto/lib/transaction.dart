import 'package:dto/user.dart';

class Transaction {
  final String title;
  final String? description;
  final double amount;
  final DateTime date;
  final User owner;
  final List<User> concerns;

  const Transaction({
    required this.title,
    this.description,
    required this.amount,
    required this.date,
    required this.owner,
    this.concerns = const [],
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      title: json['title'],
      description: json['description'],
      amount: json['amount'],
      date: json['date'].toDate(),
      owner: User.fromJson(json['owner']),
      concerns:
          json['concerns'].map<User>((user) => User.fromJson(user)).toList(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'description': description,
      'amount': amount,
      'date': date,
      'owner': owner.toJson(),
      'concerns': concerns.map((user) => user.toJson()).toList(),
    };
  }
}

List<Transaction> transactionsList = [
  Transaction(
    title: "Salle Royale",
    description: "Location pour soirée grandiose",
    amount: 500.0,
    date: DateTime(2023, 8, 19),
    owner: fictiveUsers[0],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
  ),
  Transaction(
    title: "Dîner Gourmand",
    description: "Traiteur de plaisirs culinaires",
    amount: 300.0,
    date: DateTime(2023, 8, 19),
    owner: fictiveUsers[1],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
  Transaction(
    title: "Feux d'Artifice",
    description: "Étincelles dans la nuit",
    amount: 200.0,
    date: DateTime(2023, 8, 20),
    owner: fictiveUsers[2],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[3]],
  ),
  Transaction(
    title: "Robe Étincelante",
    description: "Pour briller sous les projecteurs",
    amount: 150.0,
    date: DateTime(2023, 8, 20),
    owner: fictiveUsers[3],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
  Transaction(
    title: "Cours de Danse",
    description: "Pour impressionner sur la piste",
    amount: 80.0,
    date: DateTime(2023, 8, 21),
    owner: fictiveUsers[4],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
  ),
  Transaction(
    title: "Pansements Ampoules",
    description: "Achats préventifs pour la soirée",
    amount: 20.0,
    date: DateTime(2023, 8, 21),
    owner: fictiveUsers[5],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
  Transaction(
    title: "Crampes de Danse",
    description: "Consultation d'urgence",
    amount: 50.0,
    date: DateTime(2023, 8, 21),
    owner: fictiveUsers[0],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
  ),
  Transaction(
    title: "Talons Impressionnants",
    description: "Achats pour paraître plus grand(e)",
    amount: 75.0,
    date: DateTime(2023, 8, 21),
    owner: fictiveUsers[1],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
  Transaction(
    title: "Tapis Rouge",
    description: "Pour entrées spectaculaires",
    amount: 30.0,
    date: DateTime(2023, 8, 21),
    owner: fictiveUsers[2],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[3]],
  ),
  Transaction(
    title: "Piste de Danse VIP",
    description: "Réservation exclusive mondiale",
    amount: 1000.0,
    date: DateTime(2023, 8, 22),
    owner: fictiveUsers[3],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
  Transaction(
    title: "Chapeaux Fous",
    description: "Pour suivre le thème de la soirée",
    amount: 45.0,
    date: DateTime(2023, 8, 22),
    owner: fictiveUsers[4],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
  ),
  Transaction(
    title: "Discours Inspirants",
    description: "Cours intensif pour briller à la tribune",
    amount: 150.0,
    date: DateTime(2023, 8, 22),
    owner: fictiveUsers[5],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
  Transaction(
    title: "Feu d'Artifice Précoce",
    description: "Oups, c'était une étincelle accidentelle",
    amount: 15.0,
    date: DateTime(2023, 8, 22),
    owner: fictiveUsers[0],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
  ),
  Transaction(
    title: "Coach de Selfies",
    description: "Apprenez l'art de la pose parfaite",
    amount: 40.0,
    date: DateTime(2023, 8, 23),
    owner: fictiveUsers[1],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
  Transaction(
    title: "Achats de Confettis",
    description: "Pour rendre chaque moment éclatant",
    amount: 10.0,
    date: DateTime(2023, 8, 23),
    owner: fictiveUsers[2],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[3]],
  ),
  Transaction(
    title: "Chauffeur de Limo",
    description: "Arrivez en style... et en retard",
    amount: 200.0,
    date: DateTime(2023, 8, 24),
    owner: fictiveUsers[3],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
  Transaction(
    title: "Élégance Extrême",
    description: "Achat de gants blancs assortis",
    amount: 25.0,
    date: DateTime(2023, 8, 24),
    owner: fictiveUsers[4],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
  ),
  Transaction(
    title: "Cours de Rires Contagieux",
    description: "Fou rire garanti en une leçon",
    amount: 30.0,
    date: DateTime(2023, 8, 24),
    owner: fictiveUsers[5],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
  Transaction(
    title: "Micro pour Discours Épiques",
    description: "Se sentir comme un leader inspirant",
    amount: 50.0,
    date: DateTime(2023, 8, 24),
    owner: fictiveUsers[0],
    concerns: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
  ),
  Transaction(
    title: "Photobooth Fantastique",
    description: "Souvenirs photogéniques garantis",
    amount: 70.0,
    date: DateTime(2023, 8, 25),
    owner: fictiveUsers[1],
    concerns: [fictiveUsers[1], fictiveUsers[3], fictiveUsers[5]],
  ),
];
