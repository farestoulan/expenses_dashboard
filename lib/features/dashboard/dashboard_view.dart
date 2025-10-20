import 'package:flutter/material.dart';
import 'package:responsive_dash_board/core/size_config.dart';
import 'package:responsive_dash_board/features/dashboard/widgets/adaptive_layout_widget.dart';
import 'package:responsive_dash_board/shared/widgets/custom_drawer.dart';
import 'package:responsive_dash_board/features/dashboard/widgets/dashboard_desktop_layout.dart';
import 'package:responsive_dash_board/features/dashboard/widgets/dashboard_mobile_layout.dart';
import 'package:responsive_dash_board/features/dashboard/widgets/dashboard_tablet_layout.dart';

class DashBoradView extends StatefulWidget {
  const DashBoradView({super.key});

  @override
  State<DashBoradView> createState() => _DashBoradViewState();
}

class _DashBoradViewState extends State<DashBoradView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int activeIndex =
      0; // 0: Dashboard, 1: Transactions, 2: Statistics, 3: Wallet, 4: Investments
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? AppBar(
              elevation: 0,
              backgroundColor: const Color(0xFFFAFAFA),
              leading: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            )
          : null,
      backgroundColor: const Color(0xFFF7F9FA),
      drawer: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? CustomDrawer(
              activeIndex: activeIndex,
              onItemSelected: (index) {
                setState(() {
                  activeIndex = index;
                });
                Navigator.of(context).maybePop();
              },
            )
          : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => DashBoardMobileLayout(
          activeIndex: activeIndex,
          onItemSelected: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
        tabletLayout: (context) => DashBoardTabletLayout(
          activeIndex: activeIndex,
          onItemSelected: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
        desktopLayout: (context) => DashboardDesktopLayout(
          activeIndex: activeIndex,
          onItemSelected: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
      ),
    );
  }
}
