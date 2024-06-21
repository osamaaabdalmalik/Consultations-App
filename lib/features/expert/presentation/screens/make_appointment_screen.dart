import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:consultations_app/core/widgets/sample_sliver_appbar.dart';
import 'package:consultations_app/features/expert/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/expert/presentation/widgets/expert_full_info_card.dart';
import 'package:consultations_app/features/expert/presentation/widgets/month_select_item.dart';
import 'package:consultations_app/features/profile/presentation/widgets/consultation_cost_range_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeAppointmentScreen extends StatelessWidget {
  final Expert expert;

  const MakeAppointmentScreen({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SampleSliverAppbar(title: AppStrings.makeAppointment),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const Text(
                      AppStrings.expert,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ExpertFullInfoCard(
                      expert: expert,
                      showFavoriteButton: false,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ConsultationCostRangeSection(fontSize: 18),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const Text(
                      AppStrings.selectDayAndHour,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 70.h,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) => MonthSelectItem(
                        day: 'Mon',
                        date: '${index + 12}',
                        isSelected: index == 0,
                        onChange: (value) {},
                      ),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(
                        width: 5.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const Text(
                      AppStrings.morningHours,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Wrap(
                      spacing: 10.w,
                      children: List.generate(
                        10,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: MonthSelectItem(
                            day: '${(index + 1) % 13}:00 ${AppStrings.am}',
                            isSelected: index == 0,
                            onChange: (value) {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const Text(
                      AppStrings.eveningHours,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Wrap(
                      spacing: 10.w,
                      children: List.generate(
                        10,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: MonthSelectItem(
                            day: '${(index + 1) % 13}:00 ${AppStrings.pm}',
                            isSelected: false,
                            onChange: (value) {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const PrimaryTextField(
                    labelText: AppStrings.yourProblem,
                    hintText: AppStrings.problemHint,
                    isTextArea: true,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  PrimaryButton(
                    text: AppStrings.makeAppointment,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
