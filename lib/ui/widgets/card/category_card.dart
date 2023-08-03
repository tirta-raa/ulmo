part of '../widgets.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  ProductModel? product;
  Function()? onTap;

  CategoryCard(
    this.product, {
    super.key,
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            // Wrap the Column with Expanded
            child: Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  Text(
                    product!.name ?? '',
                    style: lightDisplay.copyWith(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
          ),
          Center(
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / 360),
              child: Image.network(
                product!.galleries![0].url ?? '',
                width: 110.w,
                height: 115.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
