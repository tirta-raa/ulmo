part of '../pages.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            34.heightBox,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      width: 56.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0XFFF6F6F6),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColor,
                        size: 24.w,
                      ),
                    ),
                  ),
                  Text(
                    'CART',
                    style: boldDisplay.copyWith(
                      fontSize: 20.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      width: 56.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0XFFF6F6F6),
                          width: 2,
                        ),
                      ),
                      child: Image.asset(
                        'assets/notif.png',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            54.heightBox,
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Order Tracking  \n',
                      style: regularDisplay.copyWith(
                        fontSize: 36.w,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Information',
                      style: boldDisplay.copyWith(
                        fontSize: 36.w,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            32.heightBox,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              padding: EdgeInsets.only(left: 28.w, bottom: 30.h),
              width: 361.w,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(34),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  28.heightBox,
                  Row(
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
                      20.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            '587952174',
                            style: regularDisplay.copyWith(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  25.heightBox,
                  Text(
                    'From',
                    style: semiBoldDisplay.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  11.heightBox,
                  Text(
                    'Brand Nike, Store',
                    style: regularDisplay.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  25.heightBox,
                  Text(
                    'From',
                    style: semiBoldDisplay.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  11.heightBox,
                  Text(
                    'Avenue Tommy House Street 12',
                    style: regularDisplay.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            28.heightBox,
            Container(
              margin: EdgeInsets.only(left: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: regularDisplay.copyWith(
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  28.heightBox,
                  Row(
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: blueColor,
                        ),
                        child: Center(
                          child: Container(
                            width: 12.w,
                            height: 12.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      20.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Received',
                            style: semiBoldDisplay.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          6.heightBox,
                          Text(
                            'Garden City of Hyderabad 1287',
                            overflow: TextOverflow.ellipsis,
                            style: regularDisplay.copyWith(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  54.heightBox,
                  Row(
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFBEE3FF),
                        ),
                        child: Center(
                          child: Container(
                            width: 12.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueColor,
                            ),
                          ),
                        ),
                      ),
                      20.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delievered',
                            style: semiBoldDisplay.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          6.heightBox,
                          Row(
                            children: [
                              Image.asset(
                                'assets/time.png',
                                width: 22,
                                height: 22,
                                color: Theme.of(context).primaryColor,
                              ),
                              8.widthBox,
                              Text(
                                '08:09 AM, 18 Jan 2023',
                                overflow: TextOverflow.ellipsis,
                                style: regularDisplay.copyWith(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
