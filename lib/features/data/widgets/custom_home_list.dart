import 'package:flutter/material.dart';
import 'package:medical/features/domain/manager/home_cubit.dart';

import '../../../core/theme/app_color.dart';

class CustomHomeList extends StatelessWidget {
  final int currentIndex;

  const CustomHomeList({super.key, required this.currentIndex,});

  @override
  Widget build(BuildContext context) {
    var doctor = HomeCubit.get(context).doctorList[currentIndex];
    return Container(
      width: double.infinity,
      height: 95,
      decoration: BoxDecoration(
        color: AppColor.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                doctor.image,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                      doctor.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            doctor.specialty,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: AppColor.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.chat_bubble_outline,
                            color: AppColor.primary,
                            size: 20,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.help_outline_rounded,
                            color: AppColor.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.favorite_border,
                            color: AppColor.primary,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
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