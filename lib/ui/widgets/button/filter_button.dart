part of '../widgets.dart';

// class FilterButton extends StatefulWidget {
//   final Function()? onTap;

//   FilterButton({super.key, this.onTap});

//   @override
//   State<FilterButton> createState() => _FilterButtonState();
// }

// class _FilterButtonState extends State<FilterButton> {
//   Artboard? _artboard;
//   StateMachineController? _controller;
//   SMIInput<bool>? _hoverInput;
//   bool _isHovered = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadRiveFile();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   void _loadRiveFile() async {
//     final bytes = await rootBundle.load('assets/rive/filter.riv');
//     final file = RiveFile.import(bytes);

//     setState(() {
//       _artboard = file.mainArtboard;
//       _controller = StateMachineController.fromArtboard(
//         _artboard!,
//         'State Machine 1',
//       );
//       _hoverInput = _controller?.findInput<bool>('Hover');
//       _artboard!.addController(_controller!);
//     });
//   }

//   void _toggleHover() {
//     if (_hoverInput != null) {
//       setState(() {
//         _isHovered = !_isHovered;
//         _hoverInput!.value = _isHovered;
//       });

//       Timer(const Duration(seconds: 2), () {
//         if (mounted) {
//           setState(() {
//             _isHovered = false; // Reset hover state to the first condition
//             _hoverInput!.value = _isHovered;
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _artboard != null
//         ? GestureDetector(
//             onTap: () {
//               _toggleHover(); // First action: Toggle hover
//               if (widget.onTap != null) {
//                 widget.onTap!(); // Second action: Call onTap function as usual
//               }
//             },
//             child: SizedBox(
//               width: 100.w,
//               height: 100.h,
//               child: Rive(
//                 artboard: _artboard!,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           )
//         : Container();
//   }
// }

class FilterButton extends StatefulWidget {
  final Function()? onTap;

  FilterButton({Key? key, this.onTap}) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  Artboard? _artboard;
  StateMachineController? _controller;
  SMIInput<bool>? _hoverInput;
  bool _isHovered = false;
  late Timer _hoverTimer;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
    _startHoverTimer();
  }

  @override
  void dispose() {
    _hoverTimer.cancel(); // Cancel the timer to avoid memory leaks
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

  void _startHoverTimer() {
    _hoverTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (mounted) {
        setState(() {
          _isHovered = !_isHovered;
          _hoverInput?.value = _isHovered;
        });
      }
    });
  }

  void _handleTap() {
    if (widget.onTap != null) {
      widget.onTap!(); // Call the provided onTap function
    }
  }

  @override
  Widget build(BuildContext context) {
    return _artboard != null
        ? GestureDetector(
            onTap: _handleTap,
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
