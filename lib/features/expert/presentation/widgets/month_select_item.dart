import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthSelectItem extends StatefulWidget {
  final String day;
  final String? date;
  final bool isSelected;
  final void Function(bool value)? onChange;

  const MonthSelectItem({
    required this.day,
    this.date,
    this.isSelected = false,
    this.onChange,
    super.key,
  });

  @override
  State<MonthSelectItem> createState() => _MonthSelectItemState();
}

class _MonthSelectItemState extends State<MonthSelectItem> {
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
        padding: EdgeInsetsDirectional.symmetric(vertical: 8.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.grayAccent,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FittedBox(
              child: Text(
                widget.day,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? AppColors.primary : AppColors.black,
                ),
              ),
            ),
            if (widget.date != null) ...[
              SizedBox(
                height: 5.h,
              ),
              FittedBox(
                child: Text(
                  widget.date!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? AppColors.primary : AppColors.black,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
