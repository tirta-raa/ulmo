import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulmo/provider/provider.dart';
import 'package:ulmo/theme/theme.dart';
import 'package:ulmo/ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize shared_preferences
  await SharedPreferences.getInstance();

  AuthProvider authProvider = AuthProvider();
  bool hasUserData = await authProvider.loadUserIdAndTokenId();

  runApp(MyApp(authProvider: authProvider, hasUserData: hasUserData));
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  final bool hasUserData;

  const MyApp({required this.authProvider, required this.hasUserData});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          _updateSystemNavigationColors(themeProvider
              .themeMode); // Update system navigation colors initially

          return ScreenUtilInit(
            designSize: const Size(428, 926),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(
                    value:
                        authProvider, // Use ChangeNotifierProvider.value for existing instances
                  ),
                  ChangeNotifierProvider(
                    create: (context) => ProductProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => WishlistProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => CartProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => CheckoutProvider(),
                  ),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  themeMode: themeProvider.themeMode,
                  // themeMode: ThemeMode.system,
                  theme: MyThemes.lightTheme,
                  darkTheme: MyThemes.darkTheme,
                  // home: WishList()
                  initialRoute: '/splash',
                  routes: {
                    '/splash': (context) => const SplashPage(),
                    '/onboarding': (context) => const OnboardingPage(),
                    '/login': (context) => const LoginPage(),
                    '/register': (context) => const RegisterPage(),
                    '/forgot-password': (context) => const ForgotPage(),
                    '/home': (context) => const MainPage(),
                    '/cart': (context) => const CartPage(),
                    '/checkout': (context) => const CheckoutPage(),
                    '/order-success': (context) => const OrderSuccessPage(),
                    '/order-sumary': (context) => const OrderSumaryPage(),
                    '/track-order': (context) => const TrackOrderPage(),
                    '/category': (context) => const CategoryPage(),
                    '/search': (context) => const SearchPage(),
                    '/profile': (context) => const ProfilePage(),
                    '/change-password': (context) => const ChangePassword(),
                    '/change-address': (context) => const ChangeAddress(),
                    '/setting': (context) => const SettingPage(),
                    '/wishlist': (context) => const WishListPage(),
                    '/notification': (context) => const NotificationPage(),
                  },
                ),
              );
            },
          );
        },
      );

  // change system navigation color
  void _updateSystemNavigationColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: themeMode == ThemeMode.dark
            ? const Color(0xFF0D111F)
            : Colors.white,
        systemNavigationBarIconBrightness:
            themeMode == ThemeMode.dark ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
