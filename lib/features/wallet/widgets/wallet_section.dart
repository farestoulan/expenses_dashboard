import 'package:flutter/material.dart';
import 'package:responsive_dash_board/core/app_styles.dart';
import 'package:responsive_dash_board/features/transactions/widgets/quick_invoice.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.sizeOf(context).width > 900;
    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BalanceCard(),
                const SizedBox(height: 24),
                _RecentTransactionsCard(),
              ],
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
          _BalanceCard(),
          const SizedBox(height: 24),
          const QuickInvoice(),
          const SizedBox(height: 24),
          _RecentTransactionsCard(),
        ],
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Current Balance', style: AppStyles.styleRegular16(context)),
              const SizedBox(height: 8),
              Text(r'\$25,430.00', style: AppStyles.styleSemiBold20(context)),
            ],
          ),
          Row(
            children: [
              _ActionButton(label: 'Add Money'),
              const SizedBox(width: 8),
              _ActionButton(label: 'Withdraw', primary: false),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.label, this.primary = true});
  final String label;
  final bool primary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              primary ? const Color(0xFF4DB7F2) : const Color(0xFFFAFAFA),
          foregroundColor: primary ? Colors.white : const Color(0xFF064061),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}

class _RecentTransactionsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Transactions',
              style: AppStyles.styleSemiBold20(context)),
          const SizedBox(height: 12),
          _RecentListPlaceholder(),
        ],
      ),
    );
  }
}

class _RecentListPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = const [
      ['Cash Withdrawal', '13 Apr, 2022', r'-\$200'],
      ['Landing Page project', '13 Apr, 2022', r'+\$2,800'],
      ['Coffee Shop', '12 Apr, 2022', r'-\$5.40'],
    ];
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          for (final r in items)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(r[0], style: AppStyles.styleSemiBold16(context)),
                        const SizedBox(height: 4),
                        Text(r[1],
                            style: AppStyles.styleRegular16(context)
                                .copyWith(color: const Color(0xFFAAAAAA))),
                      ],
                    ),
                  ),
                  Text(r[2],
                      style: AppStyles.styleSemiBold20(context).copyWith(
                        color: r[2].startsWith('-')
                            ? const Color(0xFFF3735E)
                            : const Color(0xFF2E7D32),
                      )),
                ],
              ),
            )
        ],
      ),
    );
  }
}
