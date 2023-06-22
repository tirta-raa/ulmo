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
            const SizedBox(
              height: 66,
            ),
            GoogleButton(
              onTap: () {},
            ),
            const SizedBox(
              height: 42,
            ),
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
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    text: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
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
                        const SizedBox(
                          width: 12,
                        ),
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
            const SizedBox(
              height: 42,
            ),
            CustomButton(
              text: 'Log In',
              onPressed: _isButtonEnabled ? _handleLogin : null,
              color: _isButtonEnabled ? blueColor : blueColor.withOpacity(0.5),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: regularDisplay.copyWith(color: blueColor),
              ),
            ),
            const SizedBox(
              height: 91,
            ),
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
      margin: const EdgeInsets.only(left: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              h1,
              style: boldDisplay.copyWith(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 68,
          ),
          Text(
            h2,
            style: boldDisplay.copyWith(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            h3,
            style: regularDisplay.copyWith(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
