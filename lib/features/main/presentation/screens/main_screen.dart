import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            pinned: true,
            floating: true,
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.white,
            title: Container(
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Stack(
                children: [
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomIconButton(
                                  icon: CupertinoIcons.money_pound_circle_fill,
                                  iconColor: AppColors.white,
                                  backgroundColor: AppColors.primary,
                                  size: 40,
                                  radius: 15,
                                ),
                              ),
                            ),
                            Text(
                              'Copilot',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomIconButton(
                              icon: CupertinoIcons.bell_fill,
                              iconColor: AppColors.primary,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: CustomIconButton(
                                icon: CupertinoIcons.heart_fill,
                                iconColor: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Transform.scale(
                scaleX: 0.9,
                scaleY: 0.8,
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  cursorColor: AppColors.black,
                  cursorWidth: 0.8,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: Transform.scale(
                      scaleX: 1.1,
                      scaleY: 1.2,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.search,
                          size: 20,
                          color: AppColors.gray,
                        ),
                      ),
                    ),
                    fillColor: AppColors.primary.withOpacity(0.1),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
              titlePadding: EdgeInsets.symmetric(
                vertical: 5.h,
              ),
              stretchModes: const [
                StretchMode.fadeTitle,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                ...List.generate(
                  30,
                  (index) => ListTile(
                    onTap: () {},
                    title: const Text(
                      "Main Screen",
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                    trailing: const Icon(Icons.add_a_photo_outlined),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
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
        onItemSelected: (value) {
          setState(() {
            index = value;
          });
        },
        selectedIndex: index,
      ),
    );
  }
}
