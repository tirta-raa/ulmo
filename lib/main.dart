import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ulmo/provider/theme_provider.dart';
import 'package:ulmo/theme/theme.dart';
import 'package:ulmo/ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return ScreenUtilInit(
            designSize: const Size(428, 926),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: themeProvider.themeMode,
                // themeMode: ThemeMode.system,
                theme: MyThemes.lightTheme,
                darkTheme: MyThemes.darkTheme,
                // routes: {
                //   '/': (context) => MainPage(),
                //   '/home': (context) => HomePage(),
                //   '/detail': (context) => DetailPage(),
                //   '/history': (context) => DetailPage(),
                //   '/chat': (context) => DetailPage(),
                //   '/profile': (context) => DetailPage(),
                // },
                home: ChangeAddressPage(),
              );
            },
          );
        },
      );
}
