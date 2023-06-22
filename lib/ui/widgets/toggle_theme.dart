// ignore_for_file: library_private_types_in_public_api

part of 'widgets.dart';

class ToggleTheme extends StatefulWidget {
  @override
  _ToggleThemeState createState() => _ToggleThemeState();
}

class _ToggleThemeState extends State<ToggleTheme> {
  Artboard? _artboard;
  StateMachineController? _controller;
  SMIInput<bool>? _switchInput;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final themeProvider = Provider.of<ThemeProvider>(context);
    _loadRiveFile(themeProvider.isDarkMode);
  }

  Future<void> _loadRiveFile(bool isDarkMode) async {
    final bytes = await rootBundle.load('assets/switch.riv');
    final file = RiveFile.import(bytes);

    setState(() {
      _artboard = file.mainArtboard;
      _controller = StateMachineController.fromArtboard(
        _artboard!,
        'State Machine 1',
      );
      _switchInput = _controller?.findInput<bool>('isDark');
      _switchInput?.value = isDarkMode;
      _artboard!.addController(_controller!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return _artboard != null
        ? InkWell(
            onTap: () {
              final provider = Provider.of<ThemeProvider>(
                context,
                listen: false,
              );
              provider.toggleTheme(!themeProvider.isDarkMode);
              _switchInput?.change(!themeProvider.isDarkMode);
            },
            borderRadius: BorderRadius.circular(150),
            child: SizedBox(
              height: 44,
              width: 84,
              child: Rive(
                artboard: _artboard!,
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container();
  }
}
