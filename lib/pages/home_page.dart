import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../generated/locale_keys.g.dart'; // <-- Импортируем сгенерированный g-файл

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Используем LocaleKeys.home вместо 'home'.tr()
        title: Text(LocaleKeys.home.tr(), style: AppTextStyles.title),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.waving_hand,
                      color: AppColors.white,
                      size: 32.w,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      // Используем LocaleKeys.welcome
                      LocaleKeys.welcome.tr(),
                      style: AppTextStyles.title.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              // Используем LocaleKeys.special_offers
              Text(LocaleKeys.special_offers.tr(), style: AppTextStyles.subtitle),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: _buildBannerCard(
                      // Используем LocaleKeys.banner_1
                      title: LocaleKeys.banner_1.tr(),
                      color: Colors.orangeAccent,
                      icon: Icons.local_offer,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildBannerCard(
                      // Используем LocaleKeys.banner_2
                      title: LocaleKeys.banner_2.tr(),
                      color: Colors.purpleAccent,
                      icon: Icons.new_releases,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBannerCard({
    required String title,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      height: 120.h,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color, width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28.w),
          SizedBox(height: 8.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}