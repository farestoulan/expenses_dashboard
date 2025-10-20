import 'package:flutter/material.dart';
import 'package:responsive_dash_board/features/expenses/widgets/all_expensess_and_quick_invoice_section.dart';
import 'package:responsive_dash_board/features/income/widgets/income_section.dart';
import 'package:responsive_dash_board/features/cards/widgets/my_cards_and_transction_history_section.dart';
import 'package:responsive_dash_board/shared/widgets/placeholder_section.dart';

class DashBoardMobileLayout extends StatelessWidget {
  const DashBoardMobileLayout({
    super.key,
    this.activeIndex,
    this.onItemSelected,
  });

  final int? activeIndex;
  final ValueChanged<int>? onItemSelected;

  @override
  Widget build(BuildContext context) {
    final index = activeIndex ?? 0;
    if (index != 0) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: PlaceholderSection(index: index),
        ),
      );
    }
    return const SingleChildScrollView(
      child: Column(
        children: [
          AllExpensessAndQuickInvoiceSection(),
          SizedBox(
            height: 24,
          ),
          MyCardsAndTransctionHistorySection(),
          SizedBox(
            height: 24,
          ),
          IncomeSection(),
        ],
      ),
    );
  }
}
