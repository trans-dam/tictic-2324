import 'package:dto/team.dart';
import 'package:dto/user.dart';
import 'package:firedart/firedart.dart';
import 'package:load_data_to_firestore/config.dart';
import 'package:load_data_to_firestore/teams.dart';
import 'package:load_data_to_firestore/users.dart';

String pi = PI;
String apiKey = API_KEY;

List<String> teamsId = [];

void main(List<String> arguments) async {
  Firestore.initialize(pi);
  late TokenStore tokenStore;

  tokenStore = VolatileStore();
  FirebaseAuth(apiKey, tokenStore);
  FirebaseAuth.initialize(apiKey, tokenStore);
  await addTeams();
  await addUsers().then((value) {
    for (User user in users) {
      final List<String> currentTeamsId = [];
      for (int i = 0; i < teams.length; i++) {
        if (teams[i].owner == user.email ||
            teams[i].users.contains(user.email)) {
          currentTeamsId.add(teamsId[i]);
        }
      }
      Firestore.instance.collection('users').document(user.email).update(
          {'teams': currentTeamsId.map((teamId) => 'teams/$teamId').toList()});
    }
  });

  return null;
}

Future<void> addTeams() async {
  for (Team team in teams) {
    Firestore.instance.collection('teams').add(team.toJson()).then((team) {
      teamsId.add(team.id);
    });
  }
}

Future<void> addUsers() async {
  for (User user in users) {
    Firestore.instance
        .collection('users')
        .document(user.email)
        .set(user.toJson());
    try {
      await FirebaseAuth.instance.signUp(user.email, '1234567890');
    } catch (e) {
      print(e.toString());
    }
  }
}
