import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/catlogue_screen/catlogue_screen.dart';
import 'package:xyx_vendor/screens/home/dashboard/dashboard_screen.dart';
import 'package:xyx_vendor/screens/home/order_screen/order_screen.dart';
import 'package:xyx_vendor/screens/home/profile_screen/profile_screen.dart';
import 'package:xyx_vendor/screens/home/setting_screen/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _HomeDesign();
  }
}

class _HomeDesign extends StatefulWidget {
  const _HomeDesign({Key? key}) : super(key: key);

  @override
  _HomeDesignState createState() => _HomeDesignState();
}

class _HomeDesignState extends State<_HomeDesign> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        body: SelectedBody(
          selectedIndex: selectedIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.primary,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            _bottomWidget(
              "assets/icon/bottom_home.png",
            ),
            _bottomWidget(
              "assets/icon/bottom_cart.png",
            ),
            _bottomWidget(
              "assets/icon/bottom_menu.png",
            ),
            _bottomWidget(
              "assets/icon/bottom_settings.png",
            ),
            _bottomWidget(
              "assets/icon/bottom_user.png",
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomWidget(icon) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        height: 24,
      ),
      activeIcon: Image.asset(
        icon,
        height: 24,
        color: AppColors.primary,
      ),
      label: "",
    );
  }
}

class SelectedBody extends StatefulWidget {
  final int selectedIndex;

  const SelectedBody({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _SelectedBodyState createState() => _SelectedBodyState();
}

class _SelectedBodyState extends State<SelectedBody> {
  @override
  Widget build(BuildContext context) {
    switch (widget.selectedIndex) {
      case 0:
        return DashboardScreen();
        break;
      case 1:
        return OrderScreen();
        break;
      case 2:
        return CatlogueScreen();
        break;
      case 3:
        return SettingsScreens();
        break;
      case 4:
        return ProfileScreen();
        break;
      default:
        return Container();
    }
  }
}
