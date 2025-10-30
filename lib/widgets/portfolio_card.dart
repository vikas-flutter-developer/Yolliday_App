//portfolio_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolliday_app/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PortfolioCard extends StatelessWidget {
  final String title;
  final String category;
  final String author;
  final String imageUrl;

  const PortfolioCard({
    super.key,
    required this.title,
    required this.category,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.borderColor,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12.r)),
            child: Image.asset(
              imageUrl,
              height: 110.h,
              width: 110.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 110.h,
                  width: 100.w,
                  color: AppColors.lightGreyBackground,
                  child: Icon(
                    Icons.broken_image,
                    color: AppColors.textGrey,
                    size: 40.sp,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: SizedBox(
              height: 110.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textGrey,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              author,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Container(
                          width: 50.w,
                          height: 26.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFF39519),
                                Color(0xFFFFCD67),
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/a_button.svg',
                            width: 19.23.w,
                            height: 16.h,
                            colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
