part of '../pages.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    final Brightness brightness = Theme.of(context).brightness;
    final String locationImage = brightness == Brightness.dark
        ? 'assets/location2.png'
        : 'assets/location1.png';

// token user bisa di panggil dari auth provider
    handelCheckout() async {
      if (await checkoutProvider.checkout(
        authProvider.user?.token ?? '',
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        // jadi kalau udah beres ckekout langsung cartprovider.cart [ artinya list dari cart langsung di kosongin lagi
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/order-success', (route) => false);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            32.heightBox,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
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
                    'CHECKOUT',
                    style: boldDisplay.copyWith(
                      fontSize: 20.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/notification');
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
                      text: 'List \n',
                      style: regularDisplay.copyWith(
                        fontSize: 36.w,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Items',
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
            Column(
              children: cartProvider.carts
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: CheckoutCard(e),
                    ),
                  )
                  .toList(),
            ),
            54.heightBox,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery address',
                    style: semiBoldDisplay.copyWith(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  40.heightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        locationImage,
                        width: 90.w,
                        height: 90.h,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home Address',
                              style: regularDisplay.copyWith(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            10.heightBox,
                            Text(
                              'Toodely Benson Allentown, New Mexico 31134.',
                              style: lightDisplay.copyWith(
                                color: const Color(0xFF8A91A9),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            20.heightBox,
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/edit.png',
                          width: 24.w,
                          height: 24.h,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            54.heightBox,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Subtotal',
                        style: regularDisplay.copyWith(
                          fontSize: 18,
                          color: const Color(0xFF8A91A9),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$ ${cartProvider.totalPrice()}',
                        style: regularDisplay.copyWith(
                          fontSize: 22,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  24.heightBox,
                  Row(
                    children: [
                      Text(
                        'Shipping Cost',
                        style: regularDisplay.copyWith(
                          fontSize: 18,
                          color: const Color(0xFF8A91A9),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Free',
                        style: regularDisplay.copyWith(
                          fontSize: 22,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  24.heightBox,
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: regularDisplay.copyWith(
                          fontSize: 18,
                          color: const Color(0xFF8A91A9),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$ ${cartProvider.totalPrice()}',
                        style: regularDisplay.copyWith(
                          fontSize: 22,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            63.heightBox,
            CustomButton(
              text: 'Pay Now',
              onPressed: () {
                handelCheckout();
              },
            ),
            63.heightBox,
          ],
        ),
      ),
    );
  }
}
