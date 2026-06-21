import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/main_screen.dart';
import 'screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trendo',
          routes: {
            MainScreen.id: (context) => const MainScreen(),
            UpdateProductPage.id: (context) => const UpdateProductPage(),
          },
          initialRoute: MainScreen.id,
        );
      },
    );
  }
}