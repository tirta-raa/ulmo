part of 'widgets.dart';

class FilterButton extends StatefulWidget {
  final Function()? onTap;

  FilterButton({super.key, this.onTap});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  Artboard? _artboard;
  StateMachineController? _controller;
  SMIInput<bool>? _hoverInput;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load('assets/rive/filter.riv');
    final file = RiveFile.import(bytes);

    setState(() {
      _artboard = file.mainArtboard;
      _controller = StateMachineController.fromArtboard(
        _artboard!,
        'State Machine 1',
      );
      _hoverInput = _controller?.findInput<bool>('Hover');
      _artboard!.addController(_controller!);
    });
  }

  void _toggleHover() {
    if (_hoverInput != null) {
      setState(() {
        _isHovered = !_isHovered;
        _hoverInput!.value = _isHovered;
      });

      Timer(const Duration(seconds: 2), () {
        setState(() {
          _isHovered = false; // Reset hover state to the first condition
          _hoverInput!.value = _isHovered;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _artboard != null
        ? GestureDetector(
            onTap: () {
              _toggleHover(); // First action: Toggle hover
              if (widget.onTap != null) {
                widget.onTap!(); // Second action: Call onTap function as usual
              }
            },
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Rive(
                artboard: _artboard!,
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container();
  }
}
