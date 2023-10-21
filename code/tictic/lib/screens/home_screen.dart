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
  final Stream<DocumentSnapshot<dto_user.User>>? _userStream =
      FirebaseAuth.instance.currentUser == null
          ? null
          : FirebaseFirestore.instance
              .collection('users')
              .withConverter<dto_user.User>(
                fromFirestore: (snapshot, _) =>
                    dto_user.User.fromJson(snapshot.data()!),
                toFirestore: (user, _) => user.toJson(),
              )
              .doc(FirebaseAuth.instance.currentUser!.email)
              .snapshots();

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: teams.map((e) {
                  return TeamOverview(team: e);
                }).toList(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
