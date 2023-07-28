part of '../pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  void _initializeApp() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    AuthProvider authProvider = AuthProvider();
    bool hasUserData = await authProvider.loadUserIdAndTokenId();

    if (hasUserData) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'ulmo',
              style:
                  semiBoldDisplay.copyWith(fontSize: 40, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
