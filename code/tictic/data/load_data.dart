import 'package:dto/team.dart';
import 'package:dto/user.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/cupertino.dart';

String pi = 'tictic-2023';
String apiKey = 'AIzaSyC5jgVygwAC2UVnAMI3O9DP2txqcHBOaSk';

void main(List<String> arguments) async {
  Firestore.initialize(pi);
  late TokenStore tokenStore;
  late FirebaseAuth auth;

  tokenStore = VolatileStore();
  FirebaseAuth(apiKey, tokenStore);
  FirebaseAuth.initialize(apiKey, tokenStore);

  await addUsers();
  var map = await Firestore.instance.collection("users").get();

  addTeams();
  map = await Firestore.instance.collection("teams").get();
}

void addTeams() {
  for (Team team in teams) {
    Firestore.instance.collection('teams').add(team.toJson());
  }
}

Future<void> addUsers() async {
  for (User user in fictiveUsers) {
    Firestore.instance
        .collection('users')
        .document(user.email)
        .set(user.toJson());
    try {
      await FirebaseAuth.instance.signUp(user.email, '1234567890');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
