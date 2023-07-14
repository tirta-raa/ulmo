part of '../widgets.dart';

class ChartListItem extends StatelessWidget {
  const ChartListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 134.w,
          height: 164.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / 360),
              child: Image.asset(
                'assets/shoes1.png',
                width: 153.w,
                height: 86.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        21.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Air Zoom',
              style: lightDisplay.copyWith(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
            8.heightBox,
            Text(
              '\$ 650',
              style: semiBoldDisplay.copyWith(
                fontSize: 22,
                color: Theme.of(context).primaryColor,
              ),
            ),
            22.heightBox,
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blueColor,
                    ),
                    child: Center(
                      child: Icon(Icons.add, size: 20.w),
                    ),
                  ),
                ),
                16.widthBox,
                Text(
                  1.toString(),
                  style: semiBoldDisplay.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                16.widthBox,
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        color: blueColor,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.remove, size: 20.w),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text(
                    'Are your sure you wanna remove this item?',
                    style: regularDisplay.copyWith(
                      fontSize: 22,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(
                        'Remove',
                        style: semiBoldDisplay.copyWith(
                          fontSize: 16,
                          color: const Color(0xFFFF5757),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Cancel',
                        style: regularDisplay.copyWith(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            width: 51.w,
            height: 81.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFFF5B5B),
            ),
            child: Center(
              child: Image.asset(
                'assets/trash.png',
                width: 25.w,
                height: 25.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
