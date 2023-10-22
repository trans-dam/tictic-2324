# Load Data to Firestore

Ce projet a pour objectif de publier deux collections de données fictives dans une base de données Firestore. Les deux collections sont les suivantes :

## Collection "users"

La collection "users" représente une série d'utilisateurs fictifs. Voici un exemple de données fictives pour cette collection :

```dart
import 'package:dto/user.dart';

const List<User> users = [
  // Liste d'utilisateurs fictifs
  // ...
];
```

Outre le peuplement de la collection "users", le script enregistre également ces utilisateurs dans Firebase Authentication.
Collection "teams"

## La collection "teams"
La collection "teams" concerne les groupes de personnes avec leurs transactions. Voici un exemple de données fictives pour cette collection :

```dart
import 'package:dto/team.dart';
import 'package:load_data_to_firestore/transactions.dart';
import 'package:load_data_to_firestore/users.dart';

List<Team> teams = [
// Liste de groupes fictifs avec leurs données
// ...
];
```

Chaque équipe contient des informations telles que le titre, une image, la date de début, le propriétaire, les utilisateurs associés et les transactions.

## Collection "transactions"

Les transactions liées aux groupes sont également incluses dans le projet. Voici un exemple de données fictives pour la collection "transactions" :

```dart
import 'package:dto/transaction.dart';
import 'package:load_data_to_firestore/users.dart';

List<Transaction> transactions = [
  // Liste de transactions fictives
  // ...
];
```

Chaque transaction contient des détails tels que le titre, la description, le montant, la date, le propriétaire et les personnes concernées.

L'objectif de ce projet est de faciliter le chargement de ces données fictives dans une base de données Firestore, afin de simplifier le développement d'applications utilisant ces données.

## Utilisation

Pour utiliser ce projet, il suffit de cloner le projet et de l'exécuter. Il est nécessaire d'avoir un compte Firebase, de créer un projet Firebase et d'ajouter une base de données. Si vous avez correctement configuré Firebase CLI, vous pouvez exécuter la commande suivante :

```bash
firebase firestore:delete --all-collections --project NOM_DU_PROJET
```
Ceci permet de supprimer les collections de la base données.

Ensuite, il suffit d'exécuter le projet. Attention, il faut donner les bonnes valeurs aux variables dans le fichier `main.dart`.
* `pi` = 'NOM_DU_PROJET';
* et `apiKey` = 'CLE_API'

