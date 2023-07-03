part of '../pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;
  bool remember = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _handleLogin() {
    if (_isButtonEnabled) {
      // Perform login logic here
      // Example: authenticate user
      // String email = _emailController.text;
      // String password = _passwordController.text;
      // Rest of the login logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            _HeaderText(
              h1: 'LOG IN',
              h2: 'Welcome Back!',
              h3: 'Enter password to get back your \naccount!',
            ),
            66.heightBox,
            GoogleButton(
              onTap: () {},
            ),
            42.heightBox,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: _emailController,
                    label: 'Email',
                    text: 'enter your username',
                  ),
                  40.heightBox,
                  CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    text: 'Password',
                    obscureText: true,
                  ),
                  24.heightBox,
                  InkWell(
                    onTap: () {
                      setState(() {
                        remember = !remember;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: remember ? blueColor : const Color(0xFF8A91A9),
                        ),
                        12.widthBox,
                        Text(
                          'Rember me',
                          style: regularDisplay.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            42.heightBox,
            CustomButton(
              text: 'Log In',
              onPressed: _isButtonEnabled ? _handleLogin : null,
              color: _isButtonEnabled ? blueColor : blueColor.withOpacity(0.5),
            ),
            20.heightBox,
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: regularDisplay.copyWith(color: blueColor),
              ),
            ),
            91.heightBox,
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _HeaderText extends StatelessWidget {
  String h1;
  String h2;
  String h3;

  _HeaderText({
    required this.h1,
    required this.h2,
    required this.h3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.heightBox,
          Center(
            child: Text(
              h1,
              style: boldDisplay.copyWith(
                fontSize: 20.w,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          68.heightBox,
          Text(
            h2,
            style: boldDisplay.copyWith(
              fontSize: 30.w,
              color: Theme.of(context).primaryColor,
            ),
          ),
          14.heightBox,
          Text(
            h3,
            style: regularDisplay.copyWith(
              fontSize: 22.w,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
