part of '../pages.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    _appBar() {
      return Container(
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
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                34.heightBox,
                _appBar(),
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
                  child: Column(
                    children: [
                      ChartListItem(),
                      24.heightBox,
                      ChartListItem(),
                      100.heightBox,
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.h,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Do You Have Any Voucher?',
                          style: regularDisplay.copyWith(
                              color: const Color(0xFF8A91A9)),
                        ),
                      ),
                      46.heightBox,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: regularDisplay.copyWith(
                                  color: const Color(0xFF8A91A9)),
                            ),
                            Text(
                              '\$ 1375',
                              style: regularDisplay.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      45.heightBox,
                      CustomButton(
                        onPressed: () {},
                        text: 'Checkout',
                      ),
                      42.heightBox,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
