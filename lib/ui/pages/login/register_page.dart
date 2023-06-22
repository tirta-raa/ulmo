part of '../pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
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
    return (Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            _HeaderText(
              h1: 'Register',
              h2: 'Create and Account',
              h3: 'Enter email address to create \nan account!',
            ),
            const SizedBox(
              height: 40,
            ),
            GoogleButton(
              onTap: () {},
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: _usernameController,
                    label: 'User Name',
                    text: 'enter your username',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    label: 'Email',
                    text: 'enter your email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    text: 'enter your password',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              onPressed: _isButtonEnabled ? _handleLogin : null,
              text: 'Register',
              color: _isButtonEnabled ? blueColor : blueColor.withOpacity(0.5),
            ),
            const SizedBox(
              height: 34,
            ),
          ],
        ),
      ),
    ));
  }
}
