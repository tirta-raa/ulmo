part of '../pages.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            _HeaderText(
              h1: 'FORGOT PASSWORD',
              h2: 'Forgot your Password?',
              h3: 'Enter email address we’ll send \nyou an email',
            ),
            const SizedBox(
              height: 42,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CustomTextField(
                label: 'Email',
                text: 'enter your email',
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              onPressed: () {},
              text: 'Send Mail',
            ),
          ],
        ),
      ),
    );
  }
}
