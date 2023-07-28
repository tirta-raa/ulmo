part of '../widgets.dart';

// ignore: must_be_immutable
class WishListCard extends StatelessWidget {
  ProductModel? product;

  WishListCard(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      width: 364.w,
      height: 137.h,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.heightBox,
                Text(
                  product?.name ?? '',
                  style: lightDisplay.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                5.heightBox,
                Text(
                  product?.price.toString() ?? '',
                  style: semiBoldDisplay.copyWith(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                LikeButton(
                  width: 50,
                  height: 50,
                  onTap: () {
                    wishlistProvider.setProduct(product!);
                  },
                )
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: Image.network(
                  product?.galleries?[0].url ?? '',
                  width: 110.w,
                  height: 115.h,
                  fit: BoxFit.contain,
                )),
          ),
          24.widthBox,
        ],
      ),
    );
  }
}
