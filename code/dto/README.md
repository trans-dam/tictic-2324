# Projet DTO (Data Transfer Object)

Ce projet est dédié à la création et à l'utilisation de classes DTO (Data Transfer Object) pour représenter des données structurées dans une application. Les classes DTO sont conçues pour simplifier le transfert de données entre différentes parties de votre application, telles que la couche de persistance et la couche de présentation.

## Structure des DTO

Le projet comprend plusieurs classes DTO qui représentent différents types de données. Voici un aperçu de la structure des classes DTO :

### `User`

La classe `User` représente un utilisateur avec les propriétés suivantes :
- `firstName` (prénom)
- `lastName` (nom de famille)
- `email` (adresse e-mail)

La classe `User` comprend également des méthodes pour la conversion depuis et vers des objets JSON.

### `Transaction`

La classe `Transaction` représente une transaction avec les propriétés suivantes :
- `title` (titre)
- `description` (description)
- `amount` (montant)
- `date` (date de la transaction)
- `owner` (propriétaire de la transaction)
- `concerns` (liste des personnes concernées par la transaction)

La classe `Transaction` comprend également des méthodes pour la conversion depuis et vers des objets JSON.

### `Team`

La classe `Team` représente une équipe ou un groupe de personnes avec les propriétés suivantes :
- `title` (titre de l'équipe)
- `picturePath` (chemin de l'image associée à l'équipe)
- `tags` (étiquettes associées à l'équipe)
- `startDate` (date de début de l'équipe)
- `owner` (propriétaire de l'équipe)
- `users` (liste des utilisateurs de l'équipe)
- `transactions` (liste des transactions de l'équipe)

La classe `Team` comprend également des méthodes pour la conversion depuis et vers des objets JSON, ainsi qu'une méthode `getSum` pour calculer la somme des transactions de l'équipe.

## Utilisation

Pour utiliser ces classes DTO dans votre application, vous pouvez les importer mais il faut dans un premuier temps ajouter la dépendance vers ce package dans le fichier `pubspec.yaml`. Voici un exemple :

```yaml
# Add regular dependencies here.
dependencies:
  dto:
    path: ../dto
```
Voici un exemple d'utilisation des classes DTO :

```dart
import 'package:dto/user.dart';
import 'package:dto/transaction.dart';
import 'package:dto/team.dart';

// Création d'objets User
User user = User(firstName: "John", lastName: "Doe", email: "john@example.com");

// Création d'objets Transaction
Transaction transaction = Transaction(
  title: "Achat en ligne",
  amount: 50.0,
  date: DateTime.now(),
  owner: user,
  concerns: [user],
);

// Création d'objets Team
Team team = Team(
  title: "Équipe de projet",
  startDate: DateTime(2023, 10, 1),
  owner: user,
  users: [user],
  transactions: [transaction],
);

// Utilisation des méthodes de conversion JSON
Map<String, Object?> userJson = user.toJson();
User userFromJson = User.fromJson(userJson);
