part of 'widgets.dart';

// ignore: must_be_immutable
class CustomBigCard extends StatelessWidget {
  ProductModel? product;

  CustomBigCard({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 170,
          height: 210,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / 360),
              child: product != null
                  ? Image.asset(
                      product!.image,
                      width: 153,
                      height: 86,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        product != null
            ? Text(
                product!.title,
                style: lightDisplay.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 8,
        ),
        product != null
            ? Text(
                '\$ ${product!.price}',
                style: semiBoldDisplay.copyWith(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
