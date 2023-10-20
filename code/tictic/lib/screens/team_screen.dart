import 'dart:math';

import 'package:dto/team.dart';
import 'package:flutter/material.dart';
import 'package:tictic/widgets/navigation/home_header.dart';

import '../styles/colors.dart';
import '../styles/font.dart';
import '../styles/others.dart';
import '../styles/spacings.dart';
import '../widgets/team/big_stat_container.dart';
import '../widgets/team/team_header_meta_data.dart';
import '../widgets/team/transaction_card.dart';

@immutable
class TeamScreen extends StatelessWidget {
  static const String routeName = '/team';
  final Team team;

  const TeamScreen({required this.team, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(
            vertical: kVerticalPaddingS, horizontal: kHorizontalPadding),
        decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.circular(kBorderRadius),
            boxShadow: [kShadow]),
        child: Text(
          'Ajouter une transaction',
          style: kTextDiverStyle.apply(color: Colors.white),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 2,
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeHeader(
                icon: Icons.arrow_back,
                onTap: () {
                  Navigator.pop(context);
                },
                picturePath: team.picturePath,
                small: true,
              ),
              TeamHeaderMetaData(
                title: team.title,
                userCount: team.users.length + 1,
                startDate: team.startDate,
                tags: team.tags,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  BigStatContainer(
                    label1: 'Total à payer',
                    label2: 'Total en cours',
                    value1: team.getSum(),
                    value2: Random().nextInt(100).toDouble(),
                  ),
                  Container(
                    height: kVerticalPaddingXL,
                    padding: const EdgeInsets.symmetric(
                        vertical: kVerticalPaddingS,
                        horizontal: kHorizontalPadding),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: TabBar(
                        enableFeedback: true,
                        indicatorWeight: 0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: kTextTabItem,
                        labelColor: kMainColor,
                        labelPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 0),
                        indicator: BoxDecoration(
                            color: kTertiaryColor,
                            borderRadius: BorderRadius.circular(16)),
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(text: 'Transactions'),
                          Tab(text: 'Équilibre'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(
                          left: kHorizontalPadding,
                          right: kHorizontalPadding,
                          top: kVerticalPadding),
                      child: Column(
                        children: team.transactions
                                ?.map((transaction) => TransactionCard(
                                      transaction: transaction,
                                    ))
                                .toList() ??
                            // TODO à remplacer par un widget de type "empty state"
                            [const Text('Aucune transaction')],
                      ),
                    ),
                    Container(
                        color: Colors.white,
                        child: const Center(child: Text('Cooming soon')))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
