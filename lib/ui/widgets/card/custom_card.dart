part of '../widgets.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  ProductModel? product;

  CustomCard({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(product),
                ));
          },
          child: Container(
            width: 170.w,
            height: 210.h,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: product?.galleries?.isNotEmpty == true
                    ? Image.network(
                        product!.galleries![0].url ?? '',
                        width: 153.w,
                        height: 86.h,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ),
        16.heightBox,
        product?.name?.isNotEmpty == true
            ? Text(
                product!.name ?? '',
                style: lightDisplay.copyWith(
                  fontSize: 20.w,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : const SizedBox(),
        SizedBox(
          height: 8.h,
        ),
        product != null
            ? Text(
                '\$ ${product!.price}',
                style: semiBoldDisplay.copyWith(
                  fontSize: 22.w,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
