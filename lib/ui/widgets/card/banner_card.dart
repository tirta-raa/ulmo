part of '../widgets.dart';

// ignore: must_be_immutable
class BannerCard extends StatelessWidget {
  ProductModel? product;
  Function()? onTap;

  BannerCard({
    super.key,
    this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
                  product != null ? product!.title : '',
                  style: lightDisplay.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                10.heightBox,
                Text(
                  product != null ? '\$ ${product!.price}'.toString() : '',
                  style: semiBoldDisplay.copyWith(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                10.heightBox,
                InkWell(
                  onTap: onTap,
                  child: Container(
                    width: 77.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      color: blueColor,
                    ),
                    child: Center(
                      child: Text(
                        'View',
                        style: semiBoldDisplay.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                10.heightBox,
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / 360),
              child: product != null
                  ? Image.asset(
                      product!.image,
                      width: 110.w,
                      height: 115.h,
                      fit: BoxFit.contain,
                    )
                  : const SizedBox(),
            ),
          ),
          24.widthBox,
        ],
      ),
    );
  }
}
