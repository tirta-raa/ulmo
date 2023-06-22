part of '../pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
