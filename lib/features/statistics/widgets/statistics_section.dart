import 'package:flutter/material.dart';
import 'package:responsive_dash_board/core/app_styles.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              _KpiCard(title: 'Net Income', value: r'12,340'),
              _KpiCard(title: 'Total Revenue', value: r'\$54,800'),
              _KpiCard(title: 'Total Expense', value: r'\$42,460'),
              _KpiCard(title: 'Savings Rate', value: '22%'),
            ],
          ),
          const SizedBox(height: 24),
          const _ChartCard(title: 'Income vs Expenses (Last 30 days)'),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              _ChartCard(title: 'Expenses by Category'),
              _ChartCard(title: 'Monthly Comparison'),
            ],
          ),
        ],
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  const _KpiCard({required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.styleRegular16(context)),
            const SizedBox(height: 8),
            Text(value, style: AppStyles.styleSemiBold20(context)),
          ],
        ),
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  const _ChartCard({required this.title});
  final String title;
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
          Text(title, style: AppStyles.styleSemiBold20(context)),
          const SizedBox(height: 12),
          _FakeChart(),
        ],
      ),
    );
  }
}

class _FakeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(12, (i) {
            final double h = 30 + (i * 12 % 120).toDouble();
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  height: h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4EB7F2).withOpacity(.25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
