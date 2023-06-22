import 'package:flutter/material.dart';
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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
            themeMode: themeProvider.themeMode,
            // themeMode: ThemeMode.system,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
          );
        },
      );
}
