part of '../pages.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              'assets/brand.png',
              width: 271,
              height: 257,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            text: 'Get Started',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
