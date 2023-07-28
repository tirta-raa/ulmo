part of '../pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateButtonState);
    _usernameController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _nameController.text.isNotEmpty &&
          _usernameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    void _handleLogin() async {
      setState(() {
        _isLoading = true;
      });

      if (_isButtonEnabled) {
        if (await authProvider.register(
          name: _nameController.text,
          username: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        )) {
          Navigator.pushNamed(context, '/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: const Color(0xFFFF5545),
              content: Text(
                'Gagal Register!',
                style: regularDisplay,
              ),
            ),
          );
        }
      }

      setState(() {
        _isLoading = false;
      });
    }

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
            40.heightBox,
            GoogleButton(
              onTap: () {},
            ),
            32.heightBox,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: _nameController,
                    label: 'Name',
                    text: 'enter your name',
                  ),
                  30.heightBox,
                  CustomTextField(
                    controller: _usernameController,
                    label: 'User Name',
                    text: 'enter your username',
                  ),
                  30.heightBox,
                  CustomTextField(
                    controller: _emailController,
                    label: 'Email',
                    text: 'enter your email',
                  ),
                  30.heightBox,
                  CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    text: 'enter your password',
                    obscureText: true,
                  ),
                ],
              ),
            ),
            25.heightBox,
            _isLoading
                ? Center(
                    child: LoadingAnimationWidget.fallingDot(
                      color: Theme.of(context).primaryColor,
                      size: 50.w,
                    ),
                  )
                : CustomButton(
                    onPressed: _isButtonEnabled ? _handleLogin : null,
                    text: 'Register',
                    color: _isButtonEnabled
                        ? blueColor
                        : blueColor.withOpacity(0.5),
                  ),
            20.heightBox,
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Dose Have Account? Login',
                style: regularDisplay.copyWith(color: blueColor),
              ),
            ),
            100.heightBox,
          ],
        ),
      ),
    ));
  }
}
