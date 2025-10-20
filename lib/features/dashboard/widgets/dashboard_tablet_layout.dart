import 'package:flutter/material.dart';
import 'package:responsive_dash_board/shared/widgets/custom_drawer.dart';
import 'package:responsive_dash_board/features/dashboard/widgets/dashboard_mobile_layout.dart';
import 'package:responsive_dash_board/shared/widgets/placeholder_section.dart';

class DashBoardTabletLayout extends StatelessWidget {
  const DashBoardTabletLayout(
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
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: activeIndex == 0
                  ? const DashBoardMobileLayout()
                  : PlaceholderSection(index: activeIndex),
            )),
        SizedBox(
          width: 32,
        ),
      ],
    );
  }
}
