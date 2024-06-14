import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/widgets/primary_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactSelectItem extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final void Function(bool value)? onChange;

  const ContactSelectItem({
    required this.label,
    required this.icon,
    this.isSelected = false,
    this.onChange,
    super.key,
  });

  @override
  State<ContactSelectItem> createState() => _ContactSelectItemState();
}

class _ContactSelectItemState extends State<ContactSelectItem> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onChange != null) {
          setState(() {
            isSelected = !isSelected;
            widget.onChange?.call(isSelected);
          });
        }
      },
      borderRadius: BorderRadius.circular(5.r),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 8.h, horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.grayAccent,
          ),
        ),
        child: Row(
          children: [
            PrimaryIconButton(
              icon: Icon(
                widget.icon,
                color: AppColors.primary,
                size: 15.w,
              ),
              padding: EdgeInsets.all(5.w),
              borderRadius: BorderRadius.circular(50),
            ),
            SizedBox(
              width: 5.h,
            ),
            FittedBox(
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
