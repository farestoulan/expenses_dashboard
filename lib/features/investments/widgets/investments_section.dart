import 'package:flutter/material.dart';
import 'package:responsive_dash_board/core/app_styles.dart';

class InvestmentsSection extends StatelessWidget {
  const InvestmentsSection({super.key});

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
              _KpiCard(title: 'Portfolio Value', value: r'\$86,500'),
              _KpiCard(title: "Today's P/L", value: r'+\$420'),
              _KpiCard(title: 'Total P/L', value: r'+\$6,840'),
              _KpiCard(title: 'Risk Level', value: 'Moderate'),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              _ChartCard(title: 'Portfolio Allocation'),
              _ChartCard(title: 'Portfolio Performance'),
            ],
          ),
          const SizedBox(height: 24),
          const _TableCard(title: 'Open Positions'),
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

class _TableCard extends StatelessWidget {
  const _TableCard({required this.title});
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
          _PositionsTable(),
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
          children: List.generate(10, (i) {
            final double h = 40 + (i * 15 % 140).toDouble();
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

class _PositionsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rows = [
      ['AAPL', '20', r'\$155.00', r'\$173.20', r'+\$364', '28%'],
      ['NVDA', '5', r'\$440.00', r'\$452.10', r'+\$60', '12%'],
      ['BTC', '0.12', r'\$64,000', r'\$65,300', r'+\$156', '18%'],
    ];
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: const [
              _Cell(text: 'Asset', bold: true),
              _Cell(text: 'Qty', bold: true),
              _Cell(text: 'Avg', bold: true),
              _Cell(text: 'Price', bold: true),
              _Cell(text: 'P/L', bold: true),
              _Cell(text: 'Alloc%', bold: true),
            ],
          ),
          const SizedBox(height: 8),
          for (final r in rows)
            Row(
              children: [
                _Cell(text: r[0]),
                _Cell(text: r[1]),
                _Cell(text: r[2]),
                _Cell(text: r[3]),
                _Cell(text: r[4]),
                _Cell(text: r[5]),
              ],
            )
        ],
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({required this.text, this.bold = false});
  final String text;
  final bool bold;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Text(
          text,
          style: bold
              ? AppStyles.styleSemiBold16(context)
              : AppStyles.styleRegular16(context),
        ),
      ),
    );
  }
}
