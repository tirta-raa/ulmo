part of '../widgets.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  String text;
  Function()? onTap;

  CustomListTile({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: regularDisplay.copyWith(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ],
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
