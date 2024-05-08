import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentTab;
  final void Function(int) changeCurrentTab;

  const BottomNavbar({
    super.key,
    required this.currentTab,
    required this.changeCurrentTab,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      itemCornerRadius: 15,
      containerHeight: 65,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      items: [
        BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.house),
            title: const Text(
              'Home',
            ),
            textAlign: TextAlign.center),
        BottomNavyBarItem(
          icon: const Icon(CupertinoIcons.calendar),
          title: const FittedBox(
            child: Text(
              'Appointment',
            ),
          ),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(CupertinoIcons.list_bullet_below_rectangle),
          title: const Text(
            'History',
          ),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(
            Icons.person_sharp,
            size: 25,
          ),
          title: const Text(
            'Profile',
          ),
          textAlign: TextAlign.center,
        ),
      ],
      onItemSelected: changeCurrentTab,
      selectedIndex: currentTab,
    );
  }
}
