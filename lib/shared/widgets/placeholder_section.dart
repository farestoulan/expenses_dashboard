import 'package:flutter/material.dart';
import 'package:responsive_dash_board/core/app_styles.dart';
import 'package:responsive_dash_board/features/transactions/widgets/transactions_section.dart';
import 'package:responsive_dash_board/features/statistics/widgets/statistics_section.dart';
import 'package:responsive_dash_board/features/wallet/widgets/wallet_section.dart';
import 'package:responsive_dash_board/features/investments/widgets/investments_section.dart';

class PlaceholderSection extends StatelessWidget {
  const PlaceholderSection({super.key, required this.index});

  final int index;

  String get _title {
    switch (index) {
      case 1:
        return 'My Transactions';
      case 2:
        return 'Statistics';
      case 3:
        return 'Wallet Account';
      case 4:
        return 'My Investments';
      default:
        return 'Dashboard';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return const TransactionsSection();
    }
    if (index == 2) {
      return const StatisticsSection();
    }
    if (index == 3) {
      return const WalletSection();
    }
    if (index == 4) {
      return const InvestmentsSection();
    }
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_title, style: AppStyles.styleSemiBold20(context)),
          const SizedBox(height: 12),
          Text(
            'This section is coming soon. Designed to match current UI and business scope.',
            style: AppStyles.styleRegular16(context),
          ),
        ],
      ),
    );
  }
}
