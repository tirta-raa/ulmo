part of '../pages.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final String brandImage = brightness == Brightness.dark
        ? 'assets/brand1.png'
        : 'assets/brand.png';

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/nike.png',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Image.asset(
              brandImage,
              width: 271,
              height: 257,
            ),
          ),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              'Enjoy your vacation with our super \ncomfy shoes',
              style: regularDisplay.copyWith(
                fontSize: 20,
                color: const Color(0xFF8A91A9),
              ),
            ),
          ),
          40.heightBox,
          CustomButton(
            text: 'Get Started',
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
