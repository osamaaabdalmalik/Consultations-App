import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

class BottomNavbar extends cupertino.StatefulWidget {
  const BottomNavbar({super.key});

  @override
  cupertino.State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends cupertino.State<BottomNavbar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      itemCornerRadius: 15,
      containerHeight: 65,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      items: [
        BottomNavyBarItem(
            icon: const Icon(cupertino.CupertinoIcons.house),
            title: const Text(
              'Home',
            ),
            textAlign: TextAlign.center),
        BottomNavyBarItem(
          icon: const Icon(cupertino.CupertinoIcons.calendar),
          title: const FittedBox(
            child: Text(
              'Appointment',
            ),
          ),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(cupertino.CupertinoIcons.list_bullet_below_rectangle),
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
      onItemSelected: (value) {
        setState(() {
          index = value;
        });
      },
      selectedIndex: index,
    );
  }
}
