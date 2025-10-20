import 'package:flutter/material.dart';
import 'package:responsive_dash_board/features/transactions/widgets/quick_invoice.dart';
import 'package:responsive_dash_board/features/transactions/widgets/transction_history.dart';
import 'package:responsive_dash_board/features/transactions/widgets/transactions_filter_bar.dart';
import 'package:responsive_dash_board/features/transactions/widgets/transction_history_list_view.dart';
import 'package:responsive_dash_board/shared/models/transction_model.dart';

class TransactionsSection extends StatefulWidget {
  const TransactionsSection({super.key});

  @override
  State<TransactionsSection> createState() => _TransactionsSectionState();
}

class _TransactionsSectionState extends State<TransactionsSection> {
  int typeIndex = 0; // 0 all, 1 income, 2 expense
  DateTimeRange? dateRange;
  String searchText = '';

  List<TransctionModel> get _all => TransctionHistoryListView.defaultItems;

  List<TransctionModel> get _filtered {
    return _all.where((t) {
      final bool byType = typeIndex == 0 ||
          (typeIndex == 1 && !t.isWithdrawal) ||
          (typeIndex == 2 && t.isWithdrawal);
      final bool byText = searchText.isEmpty ||
          t.title.toLowerCase().contains(searchText.toLowerCase());
      // demo: parse day only from '13 Apr, 2022 '
      bool byDate = true;
      if (dateRange != null) {
        final parts = t.date.trim().split(' '); // [13, Apr,, 2022]
        int day = int.tryParse(parts.first) ?? 1;
        // fabricate a date in current year for demo purposes
        final dt = DateTime(DateTime.now().year, DateTime.now().month, day);
        byDate = !dt.isBefore(dateRange!.start) && !dt.isAfter(dateRange!.end);
      }
      return byType && byText && byDate;
    }).toList();
  }

  Future<void> _pickRange() async {
    final now = DateTime.now();
    final res = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
      initialDateRange: dateRange ??
          DateTimeRange(start: now.subtract(const Duration(days: 7)), end: now),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF4EB7F2)),
          ),
          child: child!,
        );
      },
    );
    if (res != null) {
      setState(() => dateRange = res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isWide = width > 900;
    final filterBar = TransactionsFilterBar(
      typeIndex: typeIndex,
      onTypeChanged: (i) => setState(() => typeIndex = i),
      dateRange: dateRange,
      onPickDateRange: _pickRange,
      onSearch: (v) => setState(() => searchText = v),
    );

    final history = TransctionHistoryListView(items: _filtered);

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  filterBar,
                  const SizedBox(height: 24),
                  const TansctionHistoryHeader(),
                  const SizedBox(height: 20),
                  history,
                ],
              ),
            ),
          ),
          const SizedBox(width: 24),
          const Expanded(
            child: QuickInvoice(),
          ),
        ],
      );
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filterBar,
          const SizedBox(height: 24),
          const QuickInvoice(),
          const SizedBox(height: 24),
          const TansctionHistoryHeader(),
          const SizedBox(height: 20),
          history,
        ],
      ),
    );
  }
}
