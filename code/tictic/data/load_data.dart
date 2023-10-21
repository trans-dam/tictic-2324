import 'package:dto/team.dart';
import 'package:dto/user.dart';
import 'package:firedart/firedart.dart';

String pi = 'tictic-2023';
String api_key = 'AIzaSyC5jgVygwAC2UVnAMI3O9DP2txqcHBOaSk';

void main(List<String> arguments) async {
  Firestore.initialize(pi);
  late TokenStore tokenStore;
  late FirebaseAuth auth;

  tokenStore = VolatileStore();
  auth = FirebaseAuth(api_key, tokenStore);
  FirebaseAuth.initialize(api_key, tokenStore);

  await addUsers();
  var map = await Firestore.instance.collection("users").get();
  print(map);

  addTeams();
  map = await Firestore.instance.collection("teams").get();
  print(map);
}

void addTeams() {
  for (Team team in teams) {
    Firestore.instance.collection('teams').add({
      'title': team.title,
      'picturePath': team.picturePath,
      'startDate': team.startDate,
      'owner': team.owner.toJson(),
      'tags': team.tags?.map((e) => e).toList(),
      'users': team.users.map((e) => e.toJson()).toList(),
      'transactions': team.transactions
          ?.map((e) => {
                'amount': e.amount,
                'date': e.date,
                'title': e.title,
                'description': e.description,
                'owner': e.owner.toJson(),
                'to': e.concerns.map((e) => e.toJson()).toList(),
              })
          .toList(),
    });
  }
}

Future<void> addUsers() async {
  for (User user in fictiveUsers) {
    Firestore.instance.collection('users').document(user.email).set({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
    });
    try {
      await FirebaseAuth.instance.signUp(user.email, '1234567890');
    } catch (e) {
      print(e);
    }
  }
}
