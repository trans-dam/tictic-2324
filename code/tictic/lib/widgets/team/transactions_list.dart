import 'package:flutter/material.dart';
import 'package:tictic/models/transaction.dart';

import '../../styles/font.dart';
import '../../styles/spacings.dart';
import 'transaction_card.dart';

@immutable
class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  bool isExpand = true;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        onExpansionChanged: (bool isExpanded) {
          setState(() {
            isExpand = isExpanded;
          });
        },
        trailing: const SizedBox(),
        initiallyExpanded: isExpand,
        title: Row(
          children: [
            isExpand
                ? const Icon(Icons.keyboard_arrow_up)
                : const Icon(Icons.keyboard_arrow_down),
            isExpand
                ? const Text(
                    'Masquer les transactions',
                    style: kSmallText,
                  )
                : const Text(
                    'Voir les transactions',
                    style: kSmallText,
                  ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: kVerticalPaddingXL),
            child: Column(
              children: widget.transactions
                  .sublist(0, 3)
                  .map((transaction) => TransactionCard(
                        transaction: transaction,
                      ))
                  .toList(),
            ),
          )
        ]);
  }
}
