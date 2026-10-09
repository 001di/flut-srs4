import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../generated/locale_keys.g.dart'; // <-- 1. Импортируем сгенерированный g-файл

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 2. Заменили 'profile'.tr() на LocaleKeys.profile.tr()
        title: Text(LocaleKeys.profile.tr(), style: AppTextStyles.title),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45.r,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, size: 50.w, color: AppColors.white),
            ),
            SizedBox(height: 12.h),
            Text('Student', style: AppTextStyles.subtitle),
            Text('student@uib.kz', style: AppTextStyles.caption),
            SizedBox(height: 24.h),

            // Переключатель языка
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.language, color: AppColors.primary, size: 22.w),
                      SizedBox(width: 12.w),
                      // 2. Заменили 'language'.tr() на LocaleKeys.language.tr()
                      Text(LocaleKeys.language.tr(), style: AppTextStyles.body),
                    ],
                  ),
                  DropdownButton<Locale>(
                    value: context.locale,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: Locale('ru'),
                        child: Text('Русский'),
                      ),
                      DropdownMenuItem(
                        value: Locale('en'),
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: Locale('kk'),
                        child: Text('Қазақша'),
                      ),
                    ],
                    onChanged: (Locale? locale) {
                      if (locale != null) {
                        context.setLocale(locale); // При смене локали вся страница с LocaleKeys автоматически обновится
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),

            _buildProfileTile(
              icon: Icons.settings_outlined,
              // 2. Заменили 'settings'.tr() на LocaleKeys.settings.tr()
              title: LocaleKeys.settings.tr(),
            ),
            SizedBox(height: 12.h),
            _buildProfileTile(
              icon: Icons.info_outline,
              // 2. Заменили 'about_app'.tr() и 'app_version'.tr()
              title: LocaleKeys.about_app.tr(),
              subtitle: LocaleKeys.app_version.tr(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    String? subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary, size: 22.w),
        title: Text(title, style: AppTextStyles.body),
        subtitle: subtitle != null ? Text(subtitle, style: AppTextStyles.caption) : null,
        trailing: Icon(Icons.chevron_right, size: 20.w, color: AppColors.textSecondary),
        onTap: () {},
      ),
    );
  }
}