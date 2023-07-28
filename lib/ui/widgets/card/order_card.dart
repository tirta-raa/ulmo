part of '../widgets.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 145.h,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(34),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 112.w,
            height: 104.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Center(
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: Image.asset(
                  'assets/shoes1.png',
                  width: 89.w,
                  height: 51.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          23.widthBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Code',
                style: semiBoldDisplay.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              11.heightBox,
              Text(
                'OD - 15789523554',
                style: regularDisplay.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              8.heightBox,
              Container(
                width: 96.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(39),
                ),
                child: Center(
                  child: Text(
                    'Shiping',
                    style: regularDisplay.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
