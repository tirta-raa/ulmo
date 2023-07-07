part of '../widgets.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  String text;
  Function()? onTap;

  CustomTextButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: semiBoldDisplay.copyWith(fontSize: 18),
      ),
    );
  }
}
