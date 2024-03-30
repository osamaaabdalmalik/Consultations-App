import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                            icon: cupertino.CupertinoIcons.paintbrush_fill,
                            iconColor: AppColors.white,
                            backgroundColor: AppColors.primary,
                            size: 40,
                            iconSize: 20,
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
                        icon: cupertino.CupertinoIcons.bell_fill,
                        iconColor: AppColors.primary,
                        iconSize: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CustomIconButton(
                          icon: cupertino.CupertinoIcons.heart_fill,
                          iconColor: AppColors.primary,
                          iconSize: 20,
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
            textInputAction: TextInputAction.search,
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
    );
  }
}
