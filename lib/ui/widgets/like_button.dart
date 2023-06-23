part of 'widgets.dart';

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  Artboard? _artboard;
  StateMachineController? _controller;
  SMIInput<bool>? _switchInput;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadRiveFile();
  }

  Future<void> _loadRiveFile() async {
    final bytes = await rootBundle.load('assets/like.riv');
    final file = RiveFile.import(bytes);

    setState(() {
      _artboard = file.mainArtboard;
      _controller = StateMachineController.fromArtboard(
        _artboard!,
        'State Machine 1',
      );
      _switchInput = _controller?.findInput<bool>('Like');
      _artboard!.addController(_controller!);
    });
  }

  void _toggleLike() {
    if (_switchInput != null) {
      _switchInput!.value = !_switchInput!.value;
      _controller?.inputs.forEach((input) {
        if (input is SMIBool && input != _switchInput) {
          input.value = !_switchInput!.value;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _artboard != null
        ? GestureDetector(
            onTap: _toggleLike,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Rive(
                artboard: _artboard!,
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container();
  }
}
