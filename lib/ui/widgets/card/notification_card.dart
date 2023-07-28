part of '../widgets.dart';

class NotifcationCard extends StatelessWidget {
  const NotifcationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 94.w,
          height: 87.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).cardColor,
          ),
          child: Center(
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / 360),
              child: Image.asset(
                'assets/shoes1.png',
                width: 74.w,
                height: 42.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        24.widthBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Shoe Added to your Collection',
                style: regularDisplay.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              8.heightBox,
              Text(
                '7 New Shoe Added',
                style: lightDisplay.copyWith(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: blueColor,
          ),
        ),
      ],
    );
  }
}
