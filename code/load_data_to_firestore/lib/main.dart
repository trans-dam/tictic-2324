import 'package:dto/team.dart';
import 'package:dto/user.dart';
import 'package:firedart/firedart.dart';
import 'package:load_data_to_firestore/config.dart';
import 'package:load_data_to_firestore/teams.dart';
import 'package:load_data_to_firestore/users.dart';

String pi = PI;
String apiKey = API_KEY;

void main(List<String> arguments) async {
  Firestore.initialize(pi);
  late TokenStore tokenStore;

  tokenStore = VolatileStore();
  FirebaseAuth(apiKey, tokenStore);
  FirebaseAuth.initialize(apiKey, tokenStore);
  await addTeams();
  await addUsers();

  return null;
}

Future<void> addTeams() async {
  for (Team team in teams) {
    Firestore.instance.collection('teams').add(team.toJson());
  }
}

Future<void> addUsers() async {
  for (User user in users) {
    Firestore.instance
        .collection('users')
        .document(user.email)
        .set(user.toJson());
    await FirebaseAuth.instance.signUp(user.email, '1234567890');
  }
}
