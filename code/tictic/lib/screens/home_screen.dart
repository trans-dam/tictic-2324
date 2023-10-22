import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/team.dart';
import 'package:dto/user.dart' as dto_user;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tictic/widgets/home_title.dart';
import 'package:tictic/widgets/navigation/home_header.dart';
import 'package:tictic/widgets/team/team_overview.dart';

import '../styles/colors.dart';
import '../styles/font.dart';
import '../styles/spacings.dart';
import '../widgets/navigation/sidebar.dart';
import '../widgets/slider/info_slider.dart';

@immutable
class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Stream<DocumentSnapshot<dto_user.User>>? _userStream;
  late final Stream<QuerySnapshot>? _teamsStream;

  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      _userStream = FirebaseFirestore.instance
          .collection('users')
          .withConverter<dto_user.User>(
            fromFirestore: (snapshot, _) =>
                dto_user.User.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          )
          .doc(FirebaseAuth.instance.currentUser!.email)
          .snapshots();

      _teamsStream = FirebaseFirestore.instance
          .collection('teams')
          .where('users',
              arrayContains: FirebaseAuth.instance.currentUser!.email)
          .withConverter<Team>(
            fromFirestore: (snapshot, _) => Team.fromJson(snapshot.data()!),
            toFirestore: (team, _) => team.toJson(),
          )
          .snapshots();
    }
  }

  final items = [
    'Total à payer',
    'Total à recevoir',
    'Dernière transaction',
  ];

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackgroundColor,
      drawer: const Sidebar(),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(
              icon: Icons.menu,
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              picturePath: 'assets/img/dog.png',
            ),
            const SizedBox(
              height: kVerticalPaddingL,
            ),
            Padding(
              padding: const EdgeInsets.only(left: kHorizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FirebaseAuth.instance.currentUser == null
                      ? const HomeTitle(text: 'Bienvenue !')
                      : StreamBuilder<DocumentSnapshot<dto_user.User>>(
                          stream: _userStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot<dto_user.User>>
                                  snapshot) {
                            if (snapshot.hasError ||
                                snapshot.connectionState ==
                                    ConnectionState.waiting) {
                              return const HomeTitle(text: 'Bienvenue !');
                            }
                            return HomeTitle(
                                text:
                                    'Hey, ${snapshot.data?.data()!.firstName}!');
                          },
                        ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: kHorizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'On vous doit de l’argent 👌',
                    style: kTagLine,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kVerticalPadding,
            ),
            InfoSlider(items: items),
            const SizedBox(
              height: kVerticalPadding,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Text('Vos groupes', style: kSectionTitle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding, vertical: kVerticalPadding),
              child: FirebaseAuth.instance.currentUser == null
                  ? const Text('Vous n’êtes pas connecté')
                  : StreamBuilder<QuerySnapshot>(
                      stream: _teamsStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return const Text('Oups, une erreur est survenue !');
                        }
                        return Column(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Team team = document.data()! as Team;
                            return TeamOverview(team: team);
                          }).toList(),
                        );
                      },
                    ),
            ),
          ],
        ),
      )),
    );
  }
}
//TeamOverview(team: Team.fromJson(data));
