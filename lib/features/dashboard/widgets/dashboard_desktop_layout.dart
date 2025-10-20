import 'package:flutter/material.dart';
import 'package:responsive_dash_board/features/expenses/widgets/all_expensess_and_quick_invoice_section.dart';
import 'package:responsive_dash_board/shared/widgets/custom_drawer.dart';
import 'package:responsive_dash_board/features/income/widgets/income_section.dart';
import 'package:responsive_dash_board/features/cards/widgets/my_cards_and_transction_history_section.dart';
import 'package:responsive_dash_board/shared/widgets/placeholder_section.dart';

class DashboardDesktopLayout extends StatelessWidget {
  const DashboardDesktopLayout(
      {super.key, required this.activeIndex, required this.onItemSelected});

  final int activeIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomDrawer(
          activeIndex: activeIndex,
          onItemSelected: onItemSelected,
        )),
        SizedBox(
          width: 32,
        ),
        Expanded(
          flex: 3,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: activeIndex == 0
                    ? Row(
                        children: const [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: AllExpensessAndQuickInvoiceSection(),
                              )),
                          SizedBox(
                            width: 24,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              MyCardsAndTransctionHistorySection(),
                              SizedBox(
                                height: 24,
                              ),
                              Expanded(child: IncomeSection()),
                            ],
                          )),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: PlaceholderSection(index: activeIndex),
                      ),
              )
            ],
          ),
        )
      ],
    );
  }
}
