import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../generated/locale_keys.g.dart'; // <-- Импортируем сгенерированный g-файл

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Используем LocaleKeys.favorites вместо 'favorites'.tr()
        title: Text(LocaleKeys.favorites.tr(), style: AppTextStyles.title),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.r),
        itemCount: 3,
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 4.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.accent,
                    size: 28.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Favorite Product ${index + 1}', style: AppTextStyles.body),
                      SizedBox(height: 4.h),
                      Text(
                        // Используем LocaleKeys.price с аргументами
                        LocaleKeys.price.tr(args: ['${(index + 1) * 5000}']),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red, size: 22.w),
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}