import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePhotoSection extends StatelessWidget {
  const ProfilePhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Row(
            children: [
              Hero(
                tag: AppAssets.expert1,
                child: Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                    image: const DecorationImage(
                      image: AssetImage(
                        AppAssets.expert1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'Osama Abd Al Malik',
                      child: Text(
                        'Osama Abd Al Malik',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'osamaaabdalmalik@gmail.com',
                      child: Text(
                        'osamaaabdalmalik@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // const Divider(color: AppColors.primary,),
      ],
    );
  }
}
