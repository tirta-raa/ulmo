part of '../widgets.dart';

class GenderCard extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const GenderCard({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGenderContainer(context, 0, 'All'),
        _buildGenderContainer(context, 1, "Men's"),
        _buildGenderContainer(context, 2, "Women's"),
      ],
    );
  }

  Widget _buildGenderContainer(BuildContext context, int index, String text) {
    final isSelected = index == widget.selectedIndex;
    final color =
        isSelected ? const Color(0xFFFF5545) : Theme.of(context).cardColor;
    final width = text == 'All' ? 75.w : 120.w;

    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Container(
        width: width,
        height: 68.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: regularDisplay.copyWith(
              color: isSelected ? Colors.white : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
