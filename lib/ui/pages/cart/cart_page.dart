part of '../pages.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
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
                        text: 'Shoes Available for \n',
                        style: regularDisplay.copyWith(
                          fontSize: 36.w,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'List (2)',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32).w,
                child: Row(
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
                    Container(
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
                  ],
                ),
              ),
              24.heightBox,
            ],
          ),
        ],
      )),
    );
  }
}
