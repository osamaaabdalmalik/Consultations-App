import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppbar extends StatelessWidget {
  final Widget leading;
  final List<Widget> actions;
  final Widget sliverBottom;
  final EdgeInsetsGeometry? sliverBottomPadding;
  final double? expandedHeight;

  const CustomSliverAppbar({
    super.key,
    required this.leading,
    required this.actions,
    required this.sliverBottom,
    this.sliverBottomPadding,
    this.expandedHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight ?? 130.h,
      pinned: true,
      floating: true,
      snap: true,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.white,
      leading: const SizedBox(),
      leadingWidth: 0,
      title: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Stack(
          children: [
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leading,
                  Row(
                    children: actions,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: sliverBottom,
        titlePadding: sliverBottomPadding ??
            EdgeInsets.symmetric(
              vertical: 5.h,
            ),
        expandedTitleScale: 1,
      ),
    );
  }
}
