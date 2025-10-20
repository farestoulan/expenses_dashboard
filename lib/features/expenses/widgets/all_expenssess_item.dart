import 'package:flutter/material.dart';
import 'package:responsive_dash_board/shared/models/all_expensess_item_model.dart';
import 'package:responsive_dash_board/core/app_styles.dart';
import 'package:responsive_dash_board/features/expenses/widgets/all_expensess_header.dart';
import 'package:responsive_dash_board/features/expenses/widgets/all_expensess_item_header.dart';
import 'package:responsive_dash_board/features/expenses/widgets/inactive_and_active_all_expensesss_item.dart';

class AllExpensessItem extends StatelessWidget {
  const AllExpensessItem(
      {super.key, required this.itemModel, required this.isSelected});

  final AllExpensessItemModel itemModel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveAllExpensessItem(itemModel: itemModel)
        : InActiveAllExpensessItem(itemModel: itemModel);
  }
}
