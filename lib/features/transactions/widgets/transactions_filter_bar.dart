import 'package:flutter/material.dart';
import 'package:responsive_dash_board/core/app_styles.dart';
import 'package:responsive_dash_board/shared/widgets/custom_text_field.dart';

class TransactionsFilterBar extends StatelessWidget {
  const TransactionsFilterBar(
      {super.key,
      required this.typeIndex,
      required this.onTypeChanged,
      required this.dateRange,
      required this.onPickDateRange,
      required this.onSearch});

  final int typeIndex; // 0: All, 1: Income, 2: Expense
  final ValueChanged<int> onTypeChanged;
  final DateTimeRange? dateRange;
  final Future<void> Function() onPickDateRange;
  final ValueChanged<String> onSearch;

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
          Text('Filters', style: AppStyles.styleSemiBold20(context)),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildChip(context, label: 'All', index: 0),
              const SizedBox(width: 8),
              _buildChip(context, label: 'Income', index: 1),
              const SizedBox(width: 8),
              _buildChip(context, label: 'Expense', index: 2),
              const Spacer(),
              _DateRangeButton(
                label: dateRange == null
                    ? 'Date Range'
                    : '${dateRange!.start.month}/${dateRange!.start.day} - ${dateRange!.end.month}/${dateRange!.end.day}',
                onPressed: onPickDateRange,
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomTextField(hint: 'Search by name or note', onChanged: onSearch),
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context,
      {required String label, required int index}) {
    final bool selected = typeIndex == index;
    return ChoiceChip(
      label: Text(label,
          style: AppStyles.styleRegular16(context).copyWith(
            color: selected ? Colors.white : const Color(0xFF064061),
          )),
      selected: selected,
      selectedColor: const Color(0xFF4EB7F2),
      backgroundColor: const Color(0xFFFAFAFA),
      onSelected: (_) => onTypeChanged(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

class _DateRangeButton extends StatelessWidget {
  const _DateRangeButton({required this.label, required this.onPressed});
  final String label;
  final Future<void> Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF064061),
          side: const BorderSide(color: Color(0xFFE0E0E0)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () async {
          await onPressed();
        },
        child: Row(
          children: [
            const Icon(Icons.calendar_today,
                size: 18, color: Color(0xFF064061)),
            const SizedBox(width: 8),
            Text(label, style: AppStyles.styleRegular16(context)),
          ],
        ),
      ),
    );
  }
}
