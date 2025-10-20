import 'package:flutter/material.dart';
import 'package:responsive_dash_board/shared/models/transction_model.dart';
import 'package:responsive_dash_board/features/transactions/widgets/transction_item.dart';

class TransctionHistoryListView extends StatelessWidget {
  const TransctionHistoryListView({super.key, this.items});

  final List<TransctionModel>? items;

  static const defaultItems = [
    TransctionModel(
        title: 'Cash Withdrawal',
        date: '13 Apr, 2022 ',
        amount: r'$20,129',
        isWithdrawal: true),
    TransctionModel(
        title: 'Landing Page project',
        date: '13 Apr, 2022 ',
        amount: r'$20,129',
        isWithdrawal: false),
    TransctionModel(
        title: 'Juni Mobile App project',
        date: '13 Apr, 2022 ',
        amount: r'$20,129',
        isWithdrawal: false),
  ];
  @override
  Widget build(BuildContext context) {
    final source = items ?? defaultItems;
    return Column(
      children: source.map((e) => TransctionItem(transctionModel: e)).toList(),
    );
  }
}
