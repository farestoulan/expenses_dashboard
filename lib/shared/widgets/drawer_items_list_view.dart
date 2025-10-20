import 'package:flutter/widgets.dart';
import 'package:responsive_dash_board/shared/models/drawer_item_model.dart';
import 'package:responsive_dash_board/core/app_images.dart';
import 'package:responsive_dash_board/shared/widgets/drawer_item.dart';

class DrawerItemsListView extends StatelessWidget {
  const DrawerItemsListView({
    super.key,
    required this.activeIndex,
    required this.onItemSelected,
  });

  final int activeIndex;
  final ValueChanged<int> onItemSelected;

  final List<DrawerItemModel> items = const [
    DrawerItemModel(title: 'Dashboard', image: Assets.imagesDashboard),
    DrawerItemModel(title: 'My Transaction', image: Assets.imagesMyTransctions),
    DrawerItemModel(title: 'Statistics', image: Assets.imagesStatistics),
    DrawerItemModel(title: 'Wallet Account', image: Assets.imagesWalletAccount),
    DrawerItemModel(title: 'My Investments', image: Assets.imagesMyInvestments),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (activeIndex != index) {
              onItemSelected(index);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: DrawerItem(
              drawerItemModel: items[index],
              isActive: activeIndex == index,
            ),
          ),
        );
      },
    );
  }
}
