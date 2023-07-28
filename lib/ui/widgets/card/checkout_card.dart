part of '../widgets.dart';

class CheckoutCard extends StatelessWidget {
  CartModel? cart;
  CheckoutCard(
    this.cart, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / 360),
              child: Image.network(
                cart!.product!.galleries![0].url ?? '',
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          12.widthBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cart!.product!.name ?? '',
                style: regularDisplay.copyWith(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              2.heightBox,
              Text(
                '\$ ${(cart!.product!.price! * (cart!.quantity ?? 0))}',
                style: semiBoldDisplay.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '${cart!.quantity} item',
            style: regularDisplay.copyWith(
              fontSize: 12,
              color: const Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }
}
