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
            42.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomTextField(
                label: 'Email',
                text: 'enter your email',
              ),
            ),
            24.heightBox,
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
