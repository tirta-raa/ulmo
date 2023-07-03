part of 'widgets.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Color? color;
  double? width;
  double? height;
  Function()? onPressed;
  String text;
  double? fontSize;
  Color? textColor;
  EdgeInsets? margin;

  CustomButton({
    super.key,
    this.fontSize = 20,
    this.height = 65,
    this.color = const Color(0xFF69BCFC),
    this.margin = const EdgeInsets.symmetric(horizontal: 32),
    this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height?.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: semiBoldDisplay.copyWith(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
