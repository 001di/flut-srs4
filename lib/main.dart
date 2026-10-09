import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_colors.dart';
import 'pages/posts_page.dart'; // 1. Импортируем созданный экран

// Связь с платформой перед выполнением асинхронного кода
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
        Locale('kk'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Adaptive App',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            primaryColor: AppColors.primary,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const PostsPage(), // 2. Заменили MainScreen() на PostsPage()
    );
  }
}